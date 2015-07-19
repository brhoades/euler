class Fixnum
  def num_divisors
    divisors = 1 # (ourself)

    1.upto(Math.sqrt(self).floor) do |i|
      divisors += 2 if self.modulo(i) == 0 # we get two divisors for every factor
    end

    divisors
  end
end

# Lazy triangular number iterator
tris = Enumerator.new do |t|
  sum = 0
  1.upto(Float::INFINITY) do |i|
    sum += i

    next if sum.odd?

    t.yield sum
  end
end

tris.lazy.each do |i|
  if i.num_divisors > 500
    print i, "\n\n"
    break
  end
end
