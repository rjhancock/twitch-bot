# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      class SubsOnlyMode < Base
        def call
          Message::SubsOnlyMode.new(status: message.tags["subs-only"], channel: message.channel)
        end
      end
    end
  end
end
