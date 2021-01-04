# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a Mode event.
      class Mode < Base
        attr_reader :user, :mode

        def initialize(user:, mode:)
          @user = user
          @mode = mode
          @type = :mode
        end
      end
    end
  end
end
