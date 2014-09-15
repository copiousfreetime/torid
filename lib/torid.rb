# Torid - Temporally Ordered IDs. Generate universally unique identifiers (UUID)
# that sort lexically in time order.
module Torid
  # Public: The Version of the Torid library as a String
  VERSION = "1.2.2"

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
require 'torid/clock'
require 'torid/uuid'
require 'torid/generator'
