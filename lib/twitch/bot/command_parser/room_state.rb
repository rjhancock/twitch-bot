# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a ROOMSTATE IRC command.
      class RoomState < Base
        def call
          result = Message::NotSupported.new(message)

          roomstate_tags.each do |key, parser|
            result = parser.new(message).call if message.tags.include?(key.to_s)
          end

          result
        end

        private

        def roomstate_tags
          {
            'slow': Twitch::Bot::CommandParser::SlowMode,
            'followers-only': Twitch::Bot::CommandParser::FollowersOnlyMode,
            'subs-only': Twitch::Bot::CommandParser::SubsOnlyMode,
            'r9k': Twitch::Bot::CommandParser::R9kMode
          }
        end
      end
    end
  end
end
