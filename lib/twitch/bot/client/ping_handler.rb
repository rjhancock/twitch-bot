# frozen_string_literal: true

module Twitch
  module Bot
    # Twitch chat client object
    class Client
      # Respond to a :ping event with a pong so we don't get disconnected.
      class PingHandler < Twitch::Bot::EventHandler
        def call
          client.send_data "PONG :#{event.hostname}"
        end

        def self.handled_events
          [:ping]
        end
      end
    end
  end
end
