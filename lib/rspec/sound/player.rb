module RSpec
  module Sound
    class Player
      def initialize(success: nil, failure: nil, during_test: nil)
        @success = success
        @failure = failure
        @during_test = during_test
        @sound_pid = nil
      end

      def play_during_test(sync: false)
        play(file: @during_test, sync: sync)
      end

      def play_success(sync: true)
        play(file: @success, sync: sync)
      end

      def play_failure(sync: true)
        play(file: @failure, sync: sync)
      end

      def play(file: nil, sync: true)
        @sound_pid = spawn("mpg123 #{file}", err: '/dev/null')
        Process.waitpid(@sound_pid) if sync
      end

      def stop
        Process.kill('SIGINT', @sound_pid)
      end
    end
  end
end
