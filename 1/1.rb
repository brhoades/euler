# Project Euler #1

sumnum = 0
num = 1000

(num).times do |i|
  if i % 3 == 0
    p i.to_s + " is a multiple of 3!"
    sumnum += i
  elsif i % 5  == 0
    p i.to_s + " is a multiple of 5!"
    sumnum += i 
  end
  #p sumnum
  #p i
end

p sumnum
