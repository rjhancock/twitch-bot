# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      # Parses a 372 IRC status code/command.
      class Authenticated < Base
        def call
          Message::Authenticated.new
        end
      end
    end
  end
end
