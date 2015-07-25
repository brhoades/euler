# run "ruby 19.rb 1901 2000" 

count = 0
ARGV[0].to_i.upto(ARGV[1].to_i) do |y|
  1.upto(12) do |m|
    count += 1 if `date -d #{y}#{"%02d"%m}01 +"%A"` == "Sunday\n"
  end
end

print count, "\n"
