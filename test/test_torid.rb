require 'test_helper'
require 'torid'

module Torid
  class ToridTest < ::Minitest::Test
    def test_torid_generates_uuid
      uuid = Torid.uuid
      assert_instance_of( Torid::UUID, uuid)
      assert_equal( Torid::Generator.node_id, uuid.node_id )
    end
  end
end
