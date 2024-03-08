# Generate the FNV implementations
#
desc "generate the fnv.rb file used for the FNV functions"
task :generate_fnv do |t|
  OFFSET_SEED = "chongo <Landon Curt Noll> /\\../\\"

  # http://isthe.com/chongo/tech/comp/fnv/index.html#FNV-param
  #
  PRIMES = {
    # 32 bit FNV_prime = 2^24 + 2^8 + 0x93
    32 => (1 << 24) + (1 << 8) + 0x93,

    # 64 bit FNV_prime = 2^40 + 2^8 + 0xb3
    64 => (1 << 40) + (1 << 8) + 0xb3,

    # 128 bit FNV_prime = 2^88 + 2^8 + 0x3b
    128 => (1 << 88) + (1 << 8) + 0x3b,

    # 256 bit FNV_prime = 2^168 + 2^8 + 0x63
    256 =>  (1 << 168) + (1 << 8) + 0x63,

    # 512 bit FNV_prime = 2^344 + 2^8 + 0x57
    512 => (1 << 344) + (1 << 8) + 0x57,

    # 1024 bit FNV prime = 1024 bit FNV_prime = 2^680 + 2^8 + 0x8d
    1024 => (1 << 680) + (1 << 8) + 0x8d,
  }

  def fnv0(data: OFFSET_SEED, prime:, mask:)
    hash = 0
    data.each_byte do |byte|
      hash = ((hash * prime) ^ byte) & mask
    end
    hash
  end

  File.open("lib/torid/fnv.rb", "w+") do |f|
    pre = <<~PRE
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
    PRE

    f.puts(pre)

    indent = " " * 4

    PRIMES.each do |bits, prime|
      mask = (1 << bits) - 1
      basis = fnv0(prime:, mask:)

      prime_name = "N#{bits}_PRIME"
      basis_name = "N#{bits}_BASIS"
      mask_name  = "N#{bits}_MASK"

      f.puts
      code = <<~CODE
      #--------------------------------------------------------------------------
      # Constants and code for the #{bits} bit fnv1 and fnv1a functions
      #--------------------------------------------------------------------------
      N#{bits}_PRIME = 0x#{prime.to_s(16)}
      N#{bits}_BASIS = 0x#{basis.to_s(16)}
      N#{bits}_MASK  = 0x#{mask.to_s(16)}

      # Public: Return the #{bits} hash of the data using the fnv1 algorithm
      #
      # Example:
      #
      #   Fnv.fnv1_#{bits}(data) => >>#{bits} bit number<<
      #
      # Returns a #{bits}-bit Integer
      def self.fnv1_#{bits}(data)
        hash = #{basis_name}
        data.each_byte do |byte|
          hash = ((hash * #{prime_name}) ^ byte) & #{mask_name}
        end
        hash
      end

      # Public: Return the #{bits} hash of the data using the fnv1a algorithm
      #
      # Example:
      #
      #   Fnv.fnv1a_#{bits}(data) => >>#{bits} bit number<<
      #
      # Returns a #{bits}-bit Integer
      def self.fnv1a_#{bits}(data)
        hash = #{basis_name}
        data.each_byte do |byte|
          hash = ((hash ^ byte) * #{prime_name}) & #{mask_name}
        end
        hash
      end
      CODE

      #f.puts(code)
      code.each_line do |line|
        if line.strip.length.zero? then
          f.puts
        else
          f.puts("#{indent}#{line.chomp}")
        end
      end
    end

    f.puts(<<~POST)
      end
    end
    POST
  end
end


