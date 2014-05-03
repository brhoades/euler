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


i = 5
cnt = 2
list = [ 2, 3 ]

while true
  if isPrime? i, list 
    cnt += 1
    list << i

    if cnt == 10001
      break
    end
  end

  i += 2
end

p i
    

