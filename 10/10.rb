require_relative '../common/primes.rb'

print primesUpTo( 2000000, "esieve" ).reduce( :+ )
