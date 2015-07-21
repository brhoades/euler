require 'humanize'

print (1..1000).to_a.map { |i| i.humanize.gsub(/[[:punct:]\s]/,'').length }.reduce(:+)

