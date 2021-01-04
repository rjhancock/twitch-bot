# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a LoginFailed event.
      class LoginFailed < Base
        attr_reader :user

        def initialize(user:)
          @user = user
          @type = :login_failed
        end
      end
    end
  end
end
