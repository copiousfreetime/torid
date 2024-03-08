require 'test_helper'
require 'torid/uuid'

module Torid
  class UUIDTest < ::Minitest::Test

    def setup
      @bytes = "\x00\x04\xFD\xA3\x8Cs^\x0F\xBA\xE4\xE9\xC8n6\x84\xA5"
      @guid  = "0004fd7d-f50d-e22e-0000-00000000002a"
      @value = 1234567890
      @ulid = "01ARZ3NDEKTSV4RRFFQ69G5FAV"
    end

    def test_uuid_regex_matches
      assert_match( Torid::UUID::REGEX, @guid )
    end

    def test_uuid_match
      assert( Torid::UUID::REGEX.match( @guid ) )
    end

    def test_uuid_captures
      md = Torid::UUID::REGEX.match( @guid )
      assert_equal( @guid, md.captures.first )
    end

    def test_uuid_no_match
      assert_nil(Torid::UUID::REGEX.match( "foo" ))
    end

    def test_uuid_match_case_insensitive
      match_data = Torid::UUID::REGEX.match( @guid.upcase )
      assert_instance_of( MatchData, match_data )
    end

    def test_round_trips_bytes
      uuid = ::Torid::UUID.from( @bytes)
      assert_equal( @bytes, uuid.bytes )
    end

    # def test_extracts_timestamp_from_bytes
    #   uuid = ::Torid::UUID.from( @bytes)
    #   assert_equal( @timestamp, uuid.timestamp )
    # end

    # def test_extracts_node_id_from_bytes
    #   uuid = ::Torid::UUID.from( @bytes)
    #   assert_equal( @node_id , uuid.node_id )
    # end

    # def test_extracts_node_id_as_hex
    #   uuid = ::Torid::UUID.from( @bytes)
    #   assert_equal( @node_id_s, uuid.node_id_s )
    # end

    def test_round_trips_guid_string
      uuid = ::Torid::UUID.from( @guid )
      assert_equal( uuid.to_s, uuid.to_s )
    end

    # def test_extracts_timestamp_from_uuid
    #   uuid = ::Torid::UUID.from( @guid )
    #   assert_equal( @timestamp, uuid.timestamp )
    # end

    # def test_extracts_node_id_from_uuid
    #   uuid = ::Torid::UUID.from( @guid )
    #   assert_equal( @node_id , uuid.node_id )
    # end

    def test_create_from_raises_error
      assert_raises( ArgumentError ) do
        ::Torid::UUID.from( "abcdef" )
      end
    end

    # def test_creates_a_time_from_uuid
    #   time = Time.at( @timestamp / 1_000_000.0 )
    #   uuid = ::Torid::UUID.from( @guid )
    #   assert_equal( time, uuid.time )
    # end

    def test_standard_equality
      one   = ::Torid::UUID.from( @guid )
      other = ::Torid::UUID.from( @guid )
      assert( one == other )
      assert( other == one )
    end

    def test_case_equality
      one   = ::Torid::UUID.from( @guid )
      other = ::Torid::UUID.from( @guid )
      assert( one === other )
      assert( other === one )
    end

    def test_hash
      debugger
      one   = ::Torid::UUID.from( @guid )
      other = ::Torid::UUID.from( @guid )
      assert( one.hash == other.hash  )
    end

    def test_hash_equality
      one   = ::Torid::UUID.from( @guid )
      other = ::Torid::UUID.from( @guid )
      assert( one.eql?(other) )
      assert( other.eql?(one) )
    end

    def test_identity_comparison
      one   = ::Torid::UUID.from( @guid )
      other = ::Torid::UUID.from( @guid )
      assert( !one.equal?(other) )
      assert( !other.equal?(one) )
    end

  end
end
