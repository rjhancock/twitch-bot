# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a SlowMode event.
      class SlowMode < Base
        attr_reader :status, :channel

        def initialize(status:, channel:)
          @status = status
          @channel = channel
          @type = :slow_mode
        end

        def enabled?
          status.to_i.positive?
        end
      end
    end
  end
end
