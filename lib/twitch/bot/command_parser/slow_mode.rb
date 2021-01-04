# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      class SlowMode < Base
        def call
          Message::SlowMode.new(status: message.tags["slow"], channel: message.channel)
        end
      end
    end
  end
end
