module Torid
  # Internal:
  #
  # An implementation of Crockford's Base32 encoding and decoding, without the
  # check digit.
  #
  # https://www.crockford.com/base32.html
  module Crockford
    ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ".freeze
    DASH = "-".freeze

    BITS_PER_CODE = 5
    BASE_RADIX = (1 << BITS_PER_CODE)

    # Precalculate the string to integer mapping for the decoding to account for
    # case insensitivity and confusing characters
    #
    TO_0 = "0Oo".freeze TO_1 = "1IiLl".freeze

    DECODING = Hash.new.tap do |h|
      ENCODING.chars.each_with_index do |char, value|
        h[char] = value
        h[char.downcase] = value
      end
      TO_0.each_char do |char|
        h[char] = 0
      end
      TO_1.each_char do |char|
        h[char] = 1
      end
    end.freeze

    # Internal: Encode an integer into a Crockford Base32 string
    #
    # Example:
    #
    #   Crockkford.encode( 1234567890 ) # => "14SC0PJ"
    #
    def self.encode( value )
      case value
      when Integer
        value.digits(BASE_RADIX).map { |i| ENCODING[i] }.reverse.join
      else
        raise ArgumentError, "#{int} must be an Integer"
      end
    end

    # Internal: Decode a Crockford Base32 string into an integer
    #
    # Example:
    #  Crockford.decode( "14SC0PJ" )  # => 1234567890
    #  Crockford.decode( "14SCoPK" )  # => 1234567890
    #  Crockford.decode( "14SCOPK" )  # => 1234567890
    #  Crockford.decode( "l4SCOPK" )  # => 1234567890
    #  Crockford.decode( "L4SCOPK" )  # => 1234567890
    #  Crockford.decode( "L4S-COPK" ) # => 1234567890
    #
    def self.decode( str )
      str.chars
        .reject { |c| c == DASH }
        .reduce(0) do |acc, c|
        acc = acc * BASE_RADIX + DECODING[c]
      end
    end
  end
end
