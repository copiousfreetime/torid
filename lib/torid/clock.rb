require 'thread'
module Torid
  #
  # Clock is a time source that will never return the same value twice.
  #
  class Clock

    # Return the number of microseconds since UNIX Epoch
    def self.stamp
      now = Time.now
      (now.to_f * 1_000_000).floor
    end

    def initialize( prev_stamp = Clock.stamp, mutex = Mutex.new )
      @prev_stamp = prev_stamp
      @mutex      = mutex
    end

    # Return the next tick of the clock, which will be a Clock.stamp value.
    #
    # This method will never return the same value twice.
    def tick
      @mutex.synchronize do
        new_stamp   = Clock.stamp
        @prev_stamp = if new_stamp > @prev_stamp then
          new_stamp
        else
          @prev_stamp + 1
        end
      end
    end

    # Internal: The default instance to use for gathering ticks
    @instance = Clock.new

    def self.tick
      @instance.tick
    end

  end
end
