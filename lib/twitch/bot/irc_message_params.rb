# frozen_string_literal: true

module Twitch
  module Bot
    # This class parses the params portion of an IRC message.
    class IrcMessageParams
      attr_reader :params

      def initialize(raw_params)
        @raw_params = raw_params.strip
        @params = parse
      end

      private

      attr_reader :raw_params

      def parse
        if (match = raw_params.match(/(?:^:| :)(.*)$/))
          params = match.pre_match.split(" ")
          params << match[1]
        else
          raw_params.split(" ")
        end
      end
    end
  end
end
