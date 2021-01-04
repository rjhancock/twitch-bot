# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a NOTICE IRC command.
      class Notice < Base
        def call
          if message.params.last.match?(/Login authentication failed/)
            Message::LoginFailed.new(user: message.user)
          else
            Message::NotSupported.new(message)
          end
        end
      end
    end
  end
end
