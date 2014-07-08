require 'thread'
module Torid
  # Internal: A source for non-duplicate microsecond timestamps.
  #
  # Clock generates microsecond UNIX timestamps and guarantees that once a Clock
  # instance is created, `Clock#tick` will never return the same value twice for
  # that instance.
  #
  # This is effectively a reimplementation of
  # https://github.com/jamesgolick/lexical_uuid/blob/master/lib/increasing_microsecond_clock.rb
  # combined with
  # https://github.com/jamesgolick/lexical_uuid/blob/master/lib/time_ext.rb
  #
  class Clock

    # Internal: Return the current microsecond UNIX timstamp
    #
    # Example:
    #
    #   Clock.stamp => 1404774462369341
    #
    # Returns an Integer
    def self.stamp
      now = Time.now
      (now.to_f * 1_000_000).floor
    end

    # Internal: Create a new Clock
    #
    # prev_stamp - An initial value for the previous timestamp (default:
    #              Clock.stamp)
    # mutex      - The synchronizing object to use
    def initialize( prev_stamp = Clock.stamp, mutex = Mutex.new )
      @prev_stamp = prev_stamp
      @mutex      = mutex
    end

    # Internal: Return the next tick of the clock.
    #
    # Return the next tick of the clock, which will be a Clock.stamp value. This
    # method will continue to return ever increasing values from when it was
    # created.
    #
    # Returns an Integer.
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

    # Internal: The default instance to use for generating ticks
    @instance = Clock.new

    # Internal: Return the next `#tick` of the default Clock.
    #
    def self.tick
      @instance.tick
    end
  end
end
