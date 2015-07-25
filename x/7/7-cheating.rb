require 'prime'

i = 5
cnt = 2

while true
  if Prime::prime? i 
    cnt += 1
    if cnt == 10001
      break
    end
  end

  i += 2
end

p i
    

