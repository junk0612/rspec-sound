require 'rspec/sound/version'
require 'rspec/sound/player'

module RSpec
  module Sound
    class << self
      attr_accessor :success, :failure, :during_test
    end

    def self.before
      @player = Player.new(success: success, failure: failure, during_test: during_test)
      @player.play_during_test
    end

    def self.succeeded
      @player.stop
      @player.play_success
    end

    def self.failed
      @player.stop
      @player.play_failure
    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Sound

  config.before(:suite) do
    RSpec::Sound.before
  end

  config.after(:suite) do |example|
    if example.reporter.failed_examples.empty?
      RSpec::Sound.succeeded
    else
      RSpec::Sound.failed
    end
  end
end
