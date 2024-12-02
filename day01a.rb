# https://adventofcode.com/2024/day/1

location_ids1 = []
location_ids2 = []

STDIN.each_line do |line|
  num1, num2 = line.split.map(&:to_i)
  location_ids1 << num1
  location_ids2 << num2
end

sorted1 = location_ids1.sort
sorted2 = location_ids2.sort
pairs = sorted1.zip(sorted2)

total_distance = pairs.inject(0) { |sum, pair| sum + (pair[0] - pair[1]).abs }

puts total_distance
