# frozen_string_literal: true

module Twitch
  module Bot
    # This class parses the tags portion in an IRC message.
    # rubocop:disable Layout/LineLength
    # <message>       ::= ['@' <tags> <SPACE>] [':' <prefix> <SPACE> ] <command> <params> <crlf>
    # <tags>          ::= <tag> [';' <tag>]*
    # <tag>           ::= <key> ['=' <escaped_value>]
    # <key>           ::= [ <client_prefix> ] [ <vendor> '/' ] <key_name>
    # <client_prefix> ::= '+'
    # <key_name>      ::= <non-empty sequence of ascii letters, digits, hyphens ('-')>
    # <escaped_value> ::= <sequence of zero or more utf8 characters except NUL, CR, LF, semicolon (`;`) and SPACE>
    # <vendor>        ::= <host>
    # rubocop:enable Layout/LineLength
    class IrcMessageTags
      attr_reader :tags

      def initialize(raw_tags)
        @raw_tags = raw_tags
        @tags = parse
      end

      def [](key)
        @tags[key]
      end

      def include?(key)
        @tags.key?(key)
      end

      def numeric_state(key, name, off_value:)
        return unless tags.key?(key)

        case tags[key]
        when off_value
          "#{name}_off".to_sym
        else
          name.to_sym
        end
      end

      def boolean_state(key, name)
        return unless tags.key?(key)

        case tags[key]
        when "1"
          name
        when "0"
          "#{name}_off".to_sym
        else
          raise "Unsupported value of '#{key}'"
        end
      end

      private

      attr_reader :raw_tags

      def parse
        return unless raw_tags

        raw_tags.split(";").map { |key_value| key_value.split("=", 2) }.to_h
      end
    end
  end
end
