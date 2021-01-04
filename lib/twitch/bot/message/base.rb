# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class is the abstract base class for IRC events.
      class Base < Twitch::Bot::Event
        def initialize(_message)
          @type = :unknown
        end
      end
    end
  end
end

require_relative "authenticated"
require_relative "followers_only_mode"
require_relative "join"
require_relative "login_failed"
require_relative "mode"
require_relative "not_supported"
require_relative "ping"
require_relative "r9k_mode"
require_relative "slow_mode"
require_relative "subs_only_mode"
require_relative "subscription"
require_relative "user_message"
require_relative "user_join"
