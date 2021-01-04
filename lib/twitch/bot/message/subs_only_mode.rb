# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a SubsOnlyMode event.
      class SubsOnlyMode < Base
        attr_reader :status, :channel

        def initialize(status:, channel:)
          @status = status
          @channel = channel
          @type = :subs_only_mode
        end
      end
    end
  end
end
