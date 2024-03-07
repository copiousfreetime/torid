# Torid - Temporally Ordered IDs. Generate universally unique identifiers (UUID)
# that sort lexically in time order.
module Torid
  # Public: The Version of the Torid library as a String
  VERSION = "2.0.0"

  # Public: return the next Torid::UUID from the default Generator
  #
  # This is just a shortcut to Torid::Generator.next
  #
  # Example:
  #
  #   Torid.uuid # => Torid::UUID
  #
  # Returns a Torid::UUID
  def self.uuid
    Torid::Generator.next
  end
end
require_relative 'torid/clock'
require_relative 'torid/crockford'
require_relative 'torid/fnv'
require_relative 'torid/uuid'
require_relative 'torid/generator'
