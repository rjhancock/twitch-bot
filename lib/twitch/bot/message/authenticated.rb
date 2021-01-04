# frozen_string_literal: true

module Twitch
  module Bot
    module Message
      # This class stores the details of an Authenticated event.
      class Authenticated < Base
        def initialize
          @type = :authenticated
        end
      end
    end
  end
end
