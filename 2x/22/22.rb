require 'csv'

class String
  def score
    alphascore = ('A'..'Z').to_a
    self.split('').map { |c| (1+alphascore.index(c)) }.reduce(:+)
  end
end

names = CSV.read(ARGV[0]).flatten.sort
print names.map { |n| n.score * (1+names.index(n)) }.reduce(:+)
