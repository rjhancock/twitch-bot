# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a Ping event.
      class Ping < Base
        attr_reader :hostname

        def initialize(hostname:)
          @hostname = hostname
          @type = :ping
        end
      end
    end
  end
end
