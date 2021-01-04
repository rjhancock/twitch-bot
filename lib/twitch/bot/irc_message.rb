# frozen_string_literal: true

require_relative 'irc_message_params'
require_relative 'irc_message_tags'

module Twitch
  module Bot
    # This class splits an IRC message into its basic parts.
    # see https://ircv3.net/specs/extensions/message-tags.html#format
    #
    # rubocop:disable Layout/LineLength
    # <message>       ::= ['@' <tags> <SPACE>] [':' <prefix> <SPACE> ] <command> <params> <crlf>
    # rubocop:enable Layout/LineLength
    class IrcMessage
      attr_reader :tags, :prefix, :command, :params

      def initialize(msg)
        raw_tags, @prefix, @command, raw_params = msg.match(/^(?:@(\S+) )?(?::(\S+) )?(\S+)(.*)/).captures

        @tags   = IrcMessageTags.new(raw_tags)
        @params = IrcMessageParams.new(raw_params).params
      end

      def error
        command[/[45]\d\d/] ? command.to_i : 0
      end

      def error?
        error.positive?
      end

      def target
        channel || user
      end

      def text
        if error?
          error.to_s
        else
          params.last
        end
      end

      def user
        return unless prefix

        prefix[/^(\S+)!/, 1]
      end

      # Not really a :reek:NilCheck
      def channel
        params.detect { |param| param.start_with?("#") }&.delete("#")
      end
    end
  end
end
