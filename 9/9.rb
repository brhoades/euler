# C has to be equal to 1000 - a - b
# C has to be equal to sqrt(a^2+b^2)

a=1

list = []

while a < 1000
  b=1
  c = 1000 - a - b

  while b < 1000 and c > 0
    list << [a, b, c]
    b += 1
  end

  a += 1
end

list.uniq.each do |i|
  if Math.sqrt( i[0] ** 2 + i[1] ** 2 ) == i[2]
    p i
    exit
  end
end
