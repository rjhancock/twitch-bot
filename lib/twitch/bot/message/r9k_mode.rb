# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a R9kMode event.
      class R9kMode < Base
        attr_reader :status, :channel

        def initialize(status:, channel:)
          @status = status
          @channel = channel
          @type = :r9k_mode
        end
      end
    end
  end
end
