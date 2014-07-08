module Torid
  # Public: Represents a UUID generated by Torid
  #
  # Torid::UUID wraps 2 64bit Integer values and can convert them back and forth
  # between raw bytes and the canonical UUID form of 32 lowercase hexadecimal
  # lowercase hexadecimal digits, displayed in five groups separated by hyphens,
  # in the form 8-4-4-4-12 for a total of 36 characters (32 alphanumeric
  # characters and four hyphens)
  #
  # Since internally, Torid::UUID's represent a 64bit microsecond timestamp and
  # a 'node_id', those data fields are also able to be returned as a Time
  # instance or an Integer respectively.
  #
  # Examples
  #
  #   uuid = Torid.uuid
  #   uuid.to_s  # => "0004fda3-8c73-5e0f-bae4-e9c86e3684a5"
  #   uuid.bytes # => "\x00\x04\xFD\xA3\x8Cs^\x0F\xBA\xE4\xE9\xC8n6\x84\xA5"
  #
  #   uuid.timestamp # => Time
  #   uuid.node_id   # => Integer
  class UUID

    # Public: Create a Torid::UUID from an existing String.
    #
    # The String can either be a 16 byte binary string, or a 36byte hexadecimal
    # UUID in the 8-4-4-4-12 format.
    #
    # Examples
    #
    #   Torid::UUID.from( "0004fda3-8c73-5e0f-bae4-e9c86e3684a5" )                 # => Torid::UUID
    #   Torid::UUID.from( "\x00\x04\xFD\xA3\x8Cs^\x0F\xBA\xE4\xE9\xC8n6\x84\xA5" ) # => Torid::UUID
    #
    # Returns a Torid::UUID
    # Raises ArgumentError if the String is not convertable to a UUID.
    def self.from( str )
      case str.bytesize
      when 36
        from_string( str )
      when 16
        from_bytes( str )
      else
        raise ArgumentError, "UUID can only be loaded from a 16 byte binary string or a 36 byte formatted UUID string."
      end
    end

    # Internal: Create a new UUID from an existing string in the 8-4-4-4-12 format
    #
    # Copied from lexical_uuid
    #
    # Returns a Torid::UUID
    def self.from_string( str )
      hex   = str.split('-').join
      bytes = Array( hex ).pack("H32")
      from_bytes( bytes )
    end

    # Internal: Create a new UUID from an existing 16 byte String
    #
    # Copied from lexical_uuid
    #
    # Returns a Torid::UUID
    def self.from_bytes( bytes )
      time_high, time_low, node_high, node_low = bytes.unpack("NNNN")
      timestamp = ( time_high << 32 ) | time_low
      node_id   = ( node_high << 32 ) | node_low
      new( timestamp, node_id )
    end

    # Public: The 64bit microsecond UNIX timestamp
    attr_reader :timestamp

    # Public: The 64bit node id
    attr_reader :node_id

    # Internal: Create a new UUID.
    #
    # UUID's should only be created by calling one of the public methods that
    # generate id's. See `Torid.uuid` or `Torid::Generator.next`. This
    # constructor should not be called by users of this library.
    #
    # timestamp - an Integer value representing UNIX timestamp in microseconds
    # node_id   - an Integer value representing the unique node id where this
    #             UUID is generatoed
    #
    def initialize( timestamp = nil, node_id = nil )
      @timestamp = timestamp
      @node_id   = node_id
      @bytes     = nil
      @time      = nil
    end

    # Public: Return the Time value the internal microsecond timestamp
    # represents.
    #
    # Examples
    #
    #   uuid.time # => Time
    #
    # Returns a Time instance
    def time
      @time ||= Time.at( timestamp / 1_000_000.0 )
    end

    # Public: Return the UUID as 16 bytes of raw data.
    #
    # Copied from lexical_uuid
    #
    # Examples
    #
    #   uuid.bytes # => "\x00\x04\xFD\xA3\x8Cs^\x0F\xBA\xE4\xE9\xC8n6\x84\xA5"
    #
    # Returns a binary String
    def bytes
      @bytes ||= [ @timestamp >> 32,
                   @timestamp & 0xFFFF_FFFF,
                   @node_id   >> 32,
                   @node_id   & 0xFFFF_FFFF ].pack("NNNN")
    end

    # Public: Return the hexadecimal UUID string representation. This is the
    # standard 8-4-4-4-12 UUID string representation.
    #
    # Copied from simple_uuid via lexical_uuid.
    #
    # Examples
    #
    #   uuid.to_s  # => "0004fda3-8c73-5e0f-bae4-e9c86e3684a5"
    #
    # Returns a String
    def to_s
      elements     = bytes.unpack("NnnCCa6")
      node         = elements[-1].unpack('C*')
      elements[-1] = '%02x%02x%02x%02x%02x%02x' % node
      "%08x-%04x-%04x-%02x%02x-%s" % elements
    end
  end
end
