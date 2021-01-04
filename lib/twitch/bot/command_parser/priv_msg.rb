# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a PRIVMSG IRC command
      class PrivMsg < Base
        def call
          user = message.user
          text = message.text

          if user == "twitchnotify"
            if text.match?(/just subscribed!/)
              Message::Subscription.new(user: message.params.last.split(" ").first)
            else
              Message::NotSupported.new(message)
            end
          else
            Message::UserMessage.new(text: text, user: user)
          end
        end
      end
    end
  end
end
