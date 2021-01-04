# frozen_string_literal: true

require "bundler/setup"
Bundler.require(:default)

require_relative "bot/version"
require_relative "bot/config"
require_relative "bot/logger"
require_relative "bot/event"
require_relative "bot/event_handler"
require_relative "bot/command_handler"
require_relative "bot/client/authenticated_handler"
require_relative "bot/client/mode_handler"
require_relative "bot/client/ping_handler"
require_relative "bot/message/base"
require_relative "bot/irc_message"
require_relative "bot/command_parser/base"
require_relative "bot/message_parser"
require_relative "bot/memory/hash"
require_relative "bot/memory/redis"
require_relative "bot/channel"
require_relative "bot/adapter/irc"
require_relative "bot/adapter/terminal"
require_relative "bot/client"
