# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a PING IRC command
      class Ping < Base
        def call
          Message::Ping.new(hostname: message.params.last)
        end
      end
    end
  end
end
