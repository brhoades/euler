require 'prime'

def factor( x )
  if Prime.prime?( x )
    return [ x ]
  end 

  ret = []

  # Find the lowest number we can divide by
  2.upto Math::sqrt(x).floor do |i|
    if x % i == 0
      ret << i
      ret << factor( x / i )
      ret.flatten!
      return ret 
    end
  end
end

p factor 600851475143 
