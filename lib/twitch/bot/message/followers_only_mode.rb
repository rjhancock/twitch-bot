# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a FollowersOnlyMode event.
      class FollowersOnlyMode < Base
        attr_reader :status

        def initialize(status:)
          @status = status
          @type = :followers_only_mode
        end
      end
    end
  end
end
