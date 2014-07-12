require_relative '../common/primes.rb'

$sum = 0 
primesUpTo( 2000000, "esieve" ).map { |x| $sum += x }

print $sum
