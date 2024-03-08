require 'benchmark/ips'

# This is a quick bemchmark to compare the performance of ways to convert
# an integer to a base32 string, we want to comare a low-level way to do it
# that uses bit shifting and a high-level way that uses the Integer#digits
#
# Turns out using the digits(32) method is faster than using bit shifting...
# unless you turn on --yjit in which case the bit shifting loop is better
#
# Here are the results on my machine:
# -----------------------------------------------------------------------------
# % ruby bench_base32.rb
# ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
# Warming up --------------------------------------
#           digits(32)    51.362k i/100ms
#               shifty    50.049k i/100ms
# Calculating -------------------------------------
#           digits(32)    516.402k (± 0.7%) i/s -      5.188M in  10.046042s
#               shifty    499.623k (± 1.7%) i/s -      5.005M in  10.020259s
#
# Comparison:
#           digits(32):   516402.3 i/s
#               shifty:   499623.3 i/s - 1.03x  slower
#
# Shared at: https://ips.fastruby.io/7NL
#
# -----------------------------------------------------------------------------
# % ruby --yjit bench_base32.rb
# ruby 3.3.0 (2023-12-25 revision 5124f9ac75) +YJIT [arm64-darwin22]
# Warming up --------------------------------------
#           digits(32)    55.593k i/100ms
#               shifty    79.186k i/100ms
# Calculating -------------------------------------
#           digits(32)    557.021k (± 3.5%) i/s -      5.615M in  10.094148s
#               shifty    806.013k (± 2.7%) i/s -      8.077M in  10.028949s
#
# Comparison:
#               shifty:   806013.3 i/s
#           digits(32):   557021.4 i/s - 1.45x  slower
#
# Shared at: https://ips.fastruby.io/7NM
#
Benchmark.ips do |x|
  x.config(:time => 10, :warmup => 2)

  ENCODING = "0123456789ABCDEFGHJKMNPQRSTVWXYZ".freeze
  NUMBER =  (1e20.to_i + 1)
  BITS_PER_CODE = 5
  CODE_MASK = (1 << BITS_PER_CODE) - 1

  x.report("digits(32)") do
    value = NUMBER
    value.digits(32).map { |i| ENCODING[i] }.join
  end

  x.report("shifty") do
    chars = []
    value = NUMBER
    while value > 0
      offset = value & CODE_MASK
      chars.unshift(ENCODING[offset])
      value >>= BITS_PER_CODE
    end
    chars.join
  end

  x.compare!
end
