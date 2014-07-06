require 'test_helper'
require 'torid/clock'

module Torid
  class ClockTest < ::Minitest::Test
    def test_tick_is_after_stamp
      stamp = Clock.stamp
      tick  = Clock.tick
      assert( tick > stamp )
    end

    def test_tick_follows_clock_not_time
      stamp  = Clock.stamp
      future = stamp + 10_000_000 
      clock  = Clock.new( future )
      tick   = clock.tick
      assert_equal( future + 1, tick )
    end
  end
end
