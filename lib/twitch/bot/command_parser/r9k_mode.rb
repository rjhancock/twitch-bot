# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      class R9kMode < Base
        def call
          Message::R9kMode.new(status: message.tags["r9k"], channel: message.channel)
        end
      end
    end
  end
end
