# frozen_string_literal: true

module Twitch
  module Bot
    # Twitch chat client object
    class Client
      # Handle the :authenticated event required for joining our channel.
      class AuthenticatedHandler < Twitch::Bot::EventHandler
        def call
          client.join_default_channel
        end

        def self.handled_events
          [:authenticated]
        end
      end
    end
  end
end
