arr = (1..1000).to_a.permutation(2).to_a

arr.each do |i|
  a = i[0]
  b = i[1]

  if Math.sqrt( a ** 2 + b ** 2 ) == 1000 - a - b
    print a*b*(1000-a-b)
    exit
  end
end
