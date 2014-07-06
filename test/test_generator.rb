require 'test_helper'
require 'torid/generator'

module Torid
  class GeneratorTest < ::Minitest::Test

    def test_set_clock_on_initialize
      g = Torid::Generator.new( 'clock' )
      assert_equal( 'clock', g.clock )
    end

    def test_set_node_id_on_initialize
      g = Torid::Generator.new( 'clock', 'node-id' )
      assert_equal( 'clock', g.clock )
      assert_equal( 'node-id', g.node_id)
    end

    def test_default_clock_set_on_initializes
      g = Torid::Generator.new
      assert_equal( Torid::Clock, g.clock )
    end

    def test_default_node_id_set_on_initialize
      g = Torid::Generator.new
      assert( g.node_id > 0 )
    end

    def test_clocks_tick_is_called_on_next_uuid
      clock = ::Minitest::Mock.new
      clock.expect( :tick, 42 )
      g = Torid::Generator.new( clock )
      g.next_uuid
      clock.verify
    end

    def test_default_instance_creates_uuid
      uuid = Torid::Generator.next_uuid
      assert_instance_of( Torid::UUID, uuid )
    end
  end
end

