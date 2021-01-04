# frozen_string_literal: true

module Twitch
  module Bot
    # Twitch chat client object
    class Client
      # Handle a change in moderators on the channel.
      class ModeHandler < Twitch::Bot::EventHandler
        def call
          user = event.user
          case event.mode
          when :add_moderator
            client.add_moderator(user)
          when :remove_moderator
            client.remove_moderator(user)
          end
        end

        def self.handled_events
          [:mode]
        end
      end
    end
  end
end
