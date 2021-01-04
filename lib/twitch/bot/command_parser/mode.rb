# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a MODE IRC command
      class Mode < Base
        MODE_CHANGE = {
          "-o": :remove_moderator,
          "+o": :add_moderator,
        }.freeze

        def call
          params = message.params
          Message::Mode.new(user: params.last, mode: MODE_CHANGE[params[1]])
        end
      end
    end
  end
end
