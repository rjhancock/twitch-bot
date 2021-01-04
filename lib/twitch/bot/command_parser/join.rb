# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a 366 IRC status code/command.
      class Join < Base
        def call
          Message::Join.new
        end
      end
    end
  end
end
