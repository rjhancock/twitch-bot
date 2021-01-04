# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class represents an event that is not supported.
      class NotSupported < Base
        attr_reader :message

        def initialize(message)
          @message = message
          @type = :not_supported
        end
      end
    end
  end
end
