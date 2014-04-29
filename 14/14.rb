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

def longest_collatz( num )
  nums = Array.new

  1.upto(num) do |i|
    nums.push( collatz i )
  end
  max = nums.max
  
  [(max+1), (nums.index(max)+1)]
end

load "runner.rb"
