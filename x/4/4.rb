def isPalindrome?( x )
  if x.to_s.reverse == x.to_s
    return true
  else
    return false
  end
end

largest = 0

999.downto 100 do |i|
  999.downto 100 do |j|
    res = i*j
    if res > largest and isPalindrome? res
      largest = res
    end
  end
end

print largest

