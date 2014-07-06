# Torid is a Time Ordered ID system. It is heavily inspired by the criteria
# listed for Boundary's Flake ID generation system and the lexical_uuid gem from
# James Golick.
module Torid
  VERSION = "1.0.0"
end

require 'fnv'
require 'torid/clock'
require 'torid/uuid'
require 'torid/generator'
