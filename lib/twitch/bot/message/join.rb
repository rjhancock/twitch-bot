# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of a Join event.
      class Join < Base
        def initialize
          @type = :join
        end
      end
    end
  end
end
