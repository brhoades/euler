def isPrime?( x, list )
  sq = Math::sqrt x

  list.each do |i|
    if x % i == 0
      return false
    elsif i > sq
      break
    end
  end

  return true
end

def primesUpTo( x, method="brute" )
  if method == "brute"
    primesBrute( x )
  elsif method == "esieve"
    eSieve( x )
  end
end

def primesBrute( x )
  i = 5
  cnt = 2
  list = [ 2, 3 ]

  while true
    if i >= x
      break
    end

    if isPrime? i, list 
      list << i
    end
    i += 2
  end

  list
end

def eSieve( x )
  # Make a list of all numbers up to x
  list = (0...x).to_a
  li = 2         # list iterator
  limax = x-1

  # Now, for each number remove every multiple starting at y=list[i]*(list[i]+j) until y >= x (j is now imaginary)
  # Instead of using delete, which is costly, keep elements in their place and replace them with nil
  while li < list.size
    # If we are on a nil (not prime) skip over it
    while list[li] == nil and li < limax 
      li += 1
    end

    # Catch for ending on a nil and being done
    if list[li] == nil
      break
    end

    i = list[li]  # i will be our main iterator for removing nonprimes
    y = i*i       # y will iterate through multiples of i
    
    # Fly through multiples of our i past its square until we hit the max
    while true
     if y > x
        break
      end
      
      list[y] = nil
      y += i  
    end

    li += 1
  end

  list.compact!
  list = list[2..-1]
end

#RubyProf.start
#pr = primesUpTo 1000000
#res = RubyProf.stop

#print( "Bruteforce: ", "\n" )
#print( pr, "\n" )
#printer = RubyProf::FlatPrinter.new res
#printer.print STDOUT
#print "\n\n\n"

#RubyProf.start
#pr2 = eSieve 1000000
#res = RubyProf.stop

#print( "E's Sieve", "\n" )
#print( pr2, "\n" )
#printer = RubyProf::FlatPrinter.new res
#printer.print STDOUT
#print "\n\n\n"

#print "EQUAL: " + ( pr == pr2 ).to_s + "\n"
