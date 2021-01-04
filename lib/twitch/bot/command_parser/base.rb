module Twitch
  module Bot
    module CommandParser
      # Abstract base class for a parser for a specific IRC command.
      class Base
        attr_reader :message

        def initialize(message)
          @message = message
        end
      end
    end
  end
end

require_relative "authenticated"
require_relative "clear_chat"
require_relative "clear_msg"
require_relative "followers_only_mode"
require_relative "host"
require_relative "join"
require_relative "mode"
require_relative "notice"
require_relative "ping"
require_relative "priv_msg"
require_relative "r9k_mode"
require_relative "reconnect"
require_relative "room_state"
require_relative "slow_mode"
require_relative "subs_only_mode"
require_relative "user_join"
require_relative "user_leave"
require_relative "user_notice"
require_relative "user_state"
