require 'fnv'
require 'socket'
require 'securerandom'
require 'torid/clock'
require 'torid/uuid'

module Torid
  # Public: A class that will generate unique identifiers.
  #
  # Torid::Generator is the class that is used to generate Torid::UUID
  # instances.
  #
  # Example:
  #
  #   Torid::Generator.next # => Torid::UUID
  #
  #   generator = Torid::Generator.new
  #   generator.next                    # => Torid::UUID
  #
  class Generator
    # Internal: The Clock instance used to get 64bit timestamps
    attr_reader :clock

    # Internal: Create a new Torid UUID Generator
    #
    # clock   - an object that responds to `#tick` and returns a 64bit integer.
    #           (default: Torid::Clock)
    # node_id - the 64bit node id of this node. (default: Generator.create_node_id)
    #
    def initialize( clock = Torid::Clock, node_id = Generator.create_node_id )
      @clock   = clock
      @node_id = node_id
      @pid     = Process.pid
    end

    # Public: Return the next UUID from this generator
    #
    # Returns Torid::UUID
    def next
     Torid::UUID.new( clock.tick, node_id )
    end

    # Public: Return the node id
    #
    # This also checks if the node id is still a valid node id, by checking
    # the pid of the process and the pid of the last time the node id was
    # generated.
    #
    # Returns the node_id
    def node_id
      current_pid = Process.pid
      if current_pid != @pid then
        @pid     = current_pid
        @node_id = Generator.create_node_id( @pid )
      end
      return @node_id
    end

    # Internal: Generate a unique node identifier.
    #
    # Uses the first hostname of the system, the process id, some random bytes
    # and hashes them all together using the non-cryptographic FNV hash.
    #
    # http://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function
    #
    # This method is copied from
    # https://github.com/jamesgolick/lexical_uuid/blob/master/lib/lexical_uuid.rb#L14
    # with the random bytes added by me.
    #
    # Settled on using just `Socket.gethostname` because on MacOS Sierra the
    # hostname is not guaranteed to be round tripable through name resolution
    # locally on the machine
    #
    # Returns a 64 bit Integer
    def self.create_node_id( pid = Process.pid )
      hostname = Socket.gethostname
      random   = SecureRandom.hex( 16 )
      FNV.new.fnv1a_64("#{hostname}-#{pid}-#{random}")
    end

    # Internal: The default generator used by the system.
    @instance = ::Torid::Generator.new( Torid::Clock, Generator.create_node_id )

    # Public: Return the node id of the default Generator instance
    #
    # Returns a 64 bit Integer
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
