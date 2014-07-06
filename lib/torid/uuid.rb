module Torid
  class UUID
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

    # Create a new UUID from an existing string in the 8-4-4-4-12 format
    #
    # from lexical_uuid
    def self.from_string( str )
      hex   = str.split('-').join
      bytes = Array( hex ).pack("H32")
      from_bytes( bytes )
    end

    # from lexical_uuid
    def self.from_bytes( bytes )
      time_high, time_low, node_high, node_low = bytes.unpack("NNNN")
      timestamp = ( time_high << 32 ) | time_low
      node_id   = ( node_high << 32 ) | node_low
      new( timestamp, node_id )
    end

    attr_reader :timestamp
    attr_reader :node_id

    def initialize( timestamp = nil, node_id = nil )
      @timestamp = timestamp
      @node_id   = node_id
      @bytes     = nil
    end

    # Borrowed from lexical_uuid
    def bytes
      @bytes ||= [ @timestamp >> 32,
                   @timestamp & 0xFFFF_FFFF,
                   @node_id   >> 32,
                   @node_id   & 0xFFFF_FFFF ].pack("NNNN")
    end

    # Borrowed from simple_uuid via lexical_uuid
    def to_s
      elements     = bytes.unpack("NnnCCa6")
      node         = elements[-1].unpack('C*')
      elements[-1] = '%02x%02x%02x%02x%02x%02x' % node
      "%08x-%04x-%04x-%02x%02x-%s" % elements
    end
  end
end
