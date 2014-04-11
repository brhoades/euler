num = 1000000
  
def collatz( n )
  i = 0

  while
    if n.even?
      n /= 2
    else
      if n == 1
        break
      end
      n = 3*n+1
    end

    i += 1
  end

  i
end

def max_collatz( num )
  nums = Array.new

  1.upto(num) do |i|
    nums.push( collatz i )
  end

  nums
end

list = max_collatz( num ) 
max = list.max
p max.to_s + " " + ( list.index( max ) + 1 ).to_s
