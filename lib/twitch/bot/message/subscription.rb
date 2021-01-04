# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a Subscription event.
      class Subscription < Base
        attr_reader :user

        def initialize(user:)
          @user = user
          @type = :subscription
        end
      end
    end
  end
end
