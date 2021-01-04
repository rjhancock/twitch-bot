# frozen_string_literal: true

module Twitch
  module Bot
    module CommandParser
      class FollowersOnlyMode < Base
        def call
          Message::FollowersOnlyMode.new(status: message.tags["followers-only"])
        end
      end
    end
  end
end
