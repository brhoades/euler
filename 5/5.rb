cur = 20

def divis?( x )
  1.upto 20 do |i|
    if x % i != 0
      return false
    end
  end
  
  return true
end
  

while true
  if divis? cur
    break
  end

  cur += 20
end

print cur
