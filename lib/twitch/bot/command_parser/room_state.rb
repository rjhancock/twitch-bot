# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a ROOMSTATE IRC command.
      class RoomState < Base
        def call
          case message.tags
          when /slow/           then SlowMode.new(message).call
          when /followers-only/ then FollowersOnlyMode.new(message).call
          when /subs-only/      then SubsOnlyMode.new(message).call
          when /r9k/            then R9kMode.new(message).call
          else
            Message::NotSupported.new(message)
          end
        end
      end
    end
  end
end
