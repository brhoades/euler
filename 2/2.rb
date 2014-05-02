# Project Euler #2
#
# odd + odd = even
# even + odd = odd
# even + even = even
#XOR
#

l = 1
r = 2

sum = 0

while r <= 4000000
  if r.even?
    sum += r
  end

  newl = r
  r = r + l
  l = newl
end

p sum
