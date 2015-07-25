sumsq = 0
sqsum = 0

1.upto 100 do |i|
  sumsq += i*i
  sqsum += i
end 

sqsum *= sqsum

p sqsum-sumsq

