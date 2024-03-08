# DO NOT EDIT - THIS IS A GENERATED FILE
#
# This file is generated from the original prime configuration of the
# FNV Algorithm and is generated for runtime performance. See the
# rake task `generate_fnv` that generates this file.
#
module Torid
  # Public:
  #
  # This is an imlementation of the FNV-1 and FNV-1a hash functions
  #
  # - https://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function
  # - http://isthe.com/chongo/tech/comp/fnv/index.html
  #
  module Fnv

    #--------------------------------------------------------------------------
    # Constants and code for the 32 bit fnv1 and fnv1a functions
    #--------------------------------------------------------------------------
    N32_PRIME = 0x1000193
    N32_BASIS = 0x811c9dc5
    N32_MASK  = 0xffffffff

    # Public: Return the 32 hash of the data using the fnv1 algorithm
    #
    # Example:
    #
    #   Fnv.fnv1_32(data) => >>32 bit number<<
    #
    # Returns a 32-bit Integer
    def self.fnv1_32(data)
      hash = N32_BASIS
      data.each_byte do |byte|
        hash = ((hash * N32_PRIME) ^ byte) & N32_MASK
      end
      hash
    end

    # Public: Return the 32 hash of the data using the fnv1a algorithm
    #
    # Example:
    #
    #   Fnv.fnv1a_32(data) => >>32 bit number<<
    #
    # Returns a 32-bit Integer
    def self.fnv1a_32(data)
      hash = N32_BASIS
      data.each_byte do |byte|
        hash = ((hash ^ byte) * N32_PRIME) & N32_MASK
      end
      hash
    end

    #--------------------------------------------------------------------------
    # Constants and code for the 64 bit fnv1 and fnv1a functions
    #--------------------------------------------------------------------------
    N64_PRIME = 0x100000001b3
    N64_BASIS = 0xcbf29ce484222325
    N64_MASK  = 0xffffffffffffffff

    # Public: Return the 64 hash of the data using the fnv1 algorithm
    #
    # Example:
    #
    #   Fnv.fnv1_64(data) => >>64 bit number<<
    #
    # Returns a 64-bit Integer
    def self.fnv1_64(data)
      hash = N64_BASIS
      data.each_byte do |byte|
        hash = ((hash * N64_PRIME) ^ byte) & N64_MASK
      end
      hash
    end

    # Public: Return the 64 hash of the data using the fnv1a algorithm
    #
    # Example:
    #
    #   Fnv.fnv1a_64(data) => >>64 bit number<<
    #
    # Returns a 64-bit Integer
    def self.fnv1a_64(data)
      hash = N64_BASIS
      data.each_byte do |byte|
        hash = ((hash ^ byte) * N64_PRIME) & N64_MASK
      end
      hash
    end

    #--------------------------------------------------------------------------
    # Constants and code for the 128 bit fnv1 and fnv1a functions
    #--------------------------------------------------------------------------
    N128_PRIME = 0x1000000000000000000013b
    N128_BASIS = 0x6c62272e07bb014262b821756295c58d
    N128_MASK  = 0xffffffffffffffffffffffffffffffff

    # Public: Return the 128 hash of the data using the fnv1 algorithm
    #
    # Example:
    #
    #   Fnv.fnv1_128(data) => >>128 bit number<<
    #
    # Returns a 128-bit Integer
    def self.fnv1_128(data)
      hash = N128_BASIS
      data.each_byte do |byte|
        hash = ((hash * N128_PRIME) ^ byte) & N128_MASK
      end
      hash
    end

    # Public: Return the 128 hash of the data using the fnv1a algorithm
    #
    # Example:
    #
    #   Fnv.fnv1a_128(data) => >>128 bit number<<
    #
    # Returns a 128-bit Integer
    def self.fnv1a_128(data)
      hash = N128_BASIS
      data.each_byte do |byte|
        hash = ((hash ^ byte) * N128_PRIME) & N128_MASK
      end
      hash
    end

    #--------------------------------------------------------------------------
    # Constants and code for the 256 bit fnv1 and fnv1a functions
    #--------------------------------------------------------------------------
    N256_PRIME = 0x1000000000000000000000000000000000000000163
    N256_BASIS = 0xdd268dbcaac550362d98c384c4e576ccc8b1536847b6bbb31023b4c8caee0535
    N256_MASK  = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

    # Public: Return the 256 hash of the data using the fnv1 algorithm
    #
    # Example:
    #
    #   Fnv.fnv1_256(data) => >>256 bit number<<
    #
    # Returns a 256-bit Integer
    def self.fnv1_256(data)
      hash = N256_BASIS
      data.each_byte do |byte|
        hash = ((hash * N256_PRIME) ^ byte) & N256_MASK
      end
      hash
    end

    # Public: Return the 256 hash of the data using the fnv1a algorithm
    #
    # Example:
    #
    #   Fnv.fnv1a_256(data) => >>256 bit number<<
    #
    # Returns a 256-bit Integer
    def self.fnv1a_256(data)
      hash = N256_BASIS
      data.each_byte do |byte|
        hash = ((hash ^ byte) * N256_PRIME) & N256_MASK
      end
      hash
    end

    #--------------------------------------------------------------------------
    # Constants and code for the 512 bit fnv1 and fnv1a functions
    #--------------------------------------------------------------------------
    N512_PRIME = 0x100000000000000000000000000000000000000000000000000000000000000000000000000000000000157
    N512_BASIS = 0xb86db0b1171f4416dca1e50f309990acac87d059c90000000000000000000d21e948f68a34c192f62ea79bc942dbe7ce182036415f56e34bac982aac4afe9fd9
    N512_MASK  = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

    # Public: Return the 512 hash of the data using the fnv1 algorithm
    #
    # Example:
    #
    #   Fnv.fnv1_512(data) => >>512 bit number<<
    #
    # Returns a 512-bit Integer
    def self.fnv1_512(data)
      hash = N512_BASIS
      data.each_byte do |byte|
        hash = ((hash * N512_PRIME) ^ byte) & N512_MASK
      end
      hash
    end

    # Public: Return the 512 hash of the data using the fnv1a algorithm
    #
    # Example:
    #
    #   Fnv.fnv1a_512(data) => >>512 bit number<<
    #
    # Returns a 512-bit Integer
    def self.fnv1a_512(data)
      hash = N512_BASIS
      data.each_byte do |byte|
        hash = ((hash ^ byte) * N512_PRIME) & N512_MASK
      end
      hash
    end

    #--------------------------------------------------------------------------
    # Constants and code for the 1024 bit fnv1 and fnv1a functions
    #--------------------------------------------------------------------------
    N1024_PRIME = 0x10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018d
    N1024_BASIS = 0x5f7a76758ecc4d32e56d5a591028b74b29fc4223fdada16c3bf34eda3674da9a21d9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c6d7eb6e73802734510a555f256cc005ae556bde8cc9c6a93b21aff4b16c71ee90b3
    N1024_MASK  = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

    # Public: Return the 1024 hash of the data using the fnv1 algorithm
    #
    # Example:
    #
    #   Fnv.fnv1_1024(data) => >>1024 bit number<<
    #
    # Returns a 1024-bit Integer
    def self.fnv1_1024(data)
      hash = N1024_BASIS
      data.each_byte do |byte|
        hash = ((hash * N1024_PRIME) ^ byte) & N1024_MASK
      end
      hash
    end

    # Public: Return the 1024 hash of the data using the fnv1a algorithm
    #
    # Example:
    #
    #   Fnv.fnv1a_1024(data) => >>1024 bit number<<
    #
    # Returns a 1024-bit Integer
    def self.fnv1a_1024(data)
      hash = N1024_BASIS
      data.each_byte do |byte|
        hash = ((hash ^ byte) * N1024_PRIME) & N1024_MASK
      end
      hash
    end
  end
end
