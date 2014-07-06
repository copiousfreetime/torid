require 'test_helper'
require 'torid'

module Torid
  class VersionTest < ::Minitest::Test
    def test_has_the_proper_format
      assert_match( /\A\d+\.\d+\.\d+\Z/, Torid::VERSION)
      assert_match( /\A\d+\.\d+\.\d+\Z/, Torid::VERSION.to_s)
    end
  end
end
