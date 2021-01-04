# frozen_string_literal: true

RSpec.describe Twitch::Bot::Memory::Redis do
  describe "#store" do
    it "works with ENV connection details" do
      config = Twitch::Bot::Config.new(
        settings: {
          bot_user: "testuser",
        },
      )
      client = Twitch::Bot::Client.new(
        config: config,
        channel: "testchannel",
      )
      mem = described_class.new(client: client)

      mem.store("foo", "bar")

      expect(mem.retrieve("foo")).to eq "bar"
    end

    it "works with config connection details" do
      ENV["REDIS_URL"] ||= "redis://localhost:6379"
      url = URI.parse(ENV["REDIS_URL"])
      config = Twitch::Bot::Config.new(
        settings: {
          bot_user: "testuser",
          redis: {
            host: url.host,
            port: url.port,
          },
        },
      )
      client = Twitch::Bot::Client.new(
        config: config,
        channel: "testchannel",
      )
      mem = described_class.new(client: client)

      mem.store("foo", "bar")

      expect(mem.retrieve("foo")).to eq "bar"
    end
  end
end
