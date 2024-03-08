require 'test_helper'
require 'torid/crockford'

module Torid
  class CrockfordTest < ::Minitest::Test
    ENCODE_TESTS = {
      822354 => "S32J",
      822355 => "S32K",
      1234 => "16J",
      32 => "10",
      33 => "11",
      1234567890 => "14SC0PJ",
      1234567891 => "14SC0PK",
      1e20.to_i => "2PQHTY5NHH0000",
      (1e20.to_i + 1) =>"2PQHTY5NHH0001",
      973113317 => "X011Z5",
    }

    def test_encodings
      ENCODE_TESTS.each do |int, str|
        assert_equal( str, Crockford.encode( int ) )
      end
    end

    def test_decodings
      ENCODE_TESTS.each do |int, str|
        assert_equal( int, Crockford.decode( str ) )
      end
    end

    def test_decodings_with_mixed_case
      ENCODE_TESTS.each do |int, str|
        str = str.downcase
        assert_equal( int, Crockford.decode( str ) )
      end
    end

    def test_decodings_with_confusing_oO0
      ENCODE_TESTS.each do |int, str|
        Torid::Crockford::TO_0.each_char do |char|
          str = str.tr("0", char)
         assert_equal( int, Crockford.decode( str ) )
        end
      end
    end

    def test_decodings_with_confusing_iIlL
      ENCODE_TESTS.each do |int, str|
        Torid::Crockford::TO_1.each_char do |char|
          str = str.tr("1", char)
         assert_equal( int, Crockford.decode( str ) )
        end
      end
    end

    require 'debug'
    def test_decodings_with_hyphens
      ENCODE_TESTS.each do |int, in_str|
        str = in_str.chars.each_slice(5).map { |a| a.join("") }.join("-")
        assert_equal( int, Crockford.decode( str ) )
      end
    end
  end
end
