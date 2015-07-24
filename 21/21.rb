require 'awesome_print'

class Fixnum
  def d
    sum = 1 # for ourself / 1

    (2...Math.sqrt(self).floor).each do |i|
      quotient, remainder = self.divmod(i)

      if remainder == 0
        sum += quotient + i
      end
    end

    sum
  end
end

summap = Hash.new

(1...10000).map { |i| summap[i] = i.d }

print summap.each_key.select { |k| summap[summap[k]] == k and summap[k] != k }.reduce(:+)
