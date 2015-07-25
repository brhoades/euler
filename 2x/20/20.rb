print 100.downto(1).reduce(:*).to_s.split('').map { |i| i.to_i }.reduce(:+)
