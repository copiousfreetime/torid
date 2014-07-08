require 'fnv'
require 'socket'
require 'securerandom'
require 'torid/clock'
require 'torid/uuid'

module Torid
  class Generator
    # The clock used to get 64bit timestamps
    attr_reader :clock

    # The node_id of this instance
    attr_reader :node_id

    # Create a new Torid UUID Generator
    #
    # clock   - an object that responds to #tick and returns a 64bit integer.
    #           (default: Torid::Clock)
    # node_id - the 64bit node id of this node.(default: Generator.node_id)
    #
    def initialize( clock = Torid::Clock, node_id = Generator.node_id )
      @clock   = clock
      @node_id = node_id
    end

    # Return the next UUID from this generator
    #
    # Returns Torid::UUID
    def next
      Torid::UUID.new( @clock.tick, @node_id )
    end


    # Generate a node id that should, in all likelihood be globally unique.
    #
    # From lexical_uuid with the random bits on the end added.
    #
    # Returns 64bit Integer
    def self.create_node_id
      hostname = Socket.gethostbyname( Socket.gethostname ).first
      pid      = Process.pid
      random   = SecureRandom.hex( 16 )
      FNV.new.fnv1a_64("#{hostname}-#{pid}-#{random}")
    end

    @instance = ::Torid::Generator.new( Torid::Clock, Generator.create_node_id )

    def self.node_id
      @instance.node_id
    end

    # Public: Return the next UUID from the default Generator
    #
    # Returns a Torid::UUID
    def self.next
      @instance.next
    end
  end
end
