# frozen_string_literal: true

require_relative "command_parser/base"

module Twitch
  module Bot
    # This class calls the parser related to the IRC command we received.
    class MessageParser
      def initialize(irc_message)
        @irc_message = irc_message
      end

      def message
        parse_command
      end

      private

      attr_reader :irc_message

      def parse_command
        case irc_message.command
        when /366/        then Twitch::Bot::CommandParser::Join.new(irc_message).call
        when /372/        then Twitch::Bot::CommandParser::Authenticated.new(irc_message).call
        when /CLEARCHAT/  then Twitch::Bot::CommandParser::ClearChat.new(irc_message).call
        when /CLEARMSG/   then Twitch::Bot::CommandParser::ClearMsg.new(irc_message).call
        when /HOSTTARGET/ then Twitch::Bot::CommandParser::Host.new(irc_message).call
        when /JOIN/       then Twitch::Bot::CommandParser::UserJoin.new(irc_message).call
        when /MODE/       then Twitch::Bot::CommandParser::Mode.new(irc_message).call
        when /NOTICE/     then Twitch::Bot::CommandParser::Notice.new(irc_message).call
        when /PART/       then Twitch::Bot::CommandParser::UserLeave.new(irc_message).call
        when /PING/       then Twitch::Bot::CommandParser::Ping.new(irc_message).call
        when /PRIVMSG/    then Twitch::Bot::CommandParser::PrivMsg.new(irc_message).call
        when /ROOMSTATE/  then Twitch::Bot::CommandParser::RoomState.new(irc_message).call
        when /RECONNECT/  then Twitch::Bot::CommandParser::Reconnect.new(irc_message).call
        when /USERNOTICE/ then Twitch::Bot::CommandParser::UserNotice.new(irc_message).call
        when /USERSTATE/  then Twitch::Bot::CommandParser::UserState.new(irc_message).call
        else
          Message::NotSupported.new(irc_message)
        end
      end
    end
  end
end
