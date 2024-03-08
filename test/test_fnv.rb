require 'test_helper'
require 'torid/fnv'
require 'debug'

module Torid
  class FnvTest < ::Minitest::Test
    def test_fnv1a_32
      [
        ["", 0x811c9dc5],
        ["a", 0xe40c292c],
        ["foobar", 0xbf9cf968],
      ].each do |data, result|
        assert_equal(Torid::Fnv.fnv1a_32(data), result)
      end
    end
  end
end
