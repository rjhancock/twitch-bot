# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a JOIN IRC command
      class UserJoin < Base
        def call
          user = message.user
          text = message.text
          Message::UserJoin.new(text: text, user: user)
        end
      end
    end
  end
end
