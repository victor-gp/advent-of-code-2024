# https://adventofcode.com/2024/day/1

ids_left = []
ids_right = []

STDIN.each_line do |line|
  id_left, id_right = line.split.map(&:to_i)
  ids_left << id_left
  ids_right << id_right
end

sorted_left = ids_left.sort
sorted_right = ids_right.sort
pairs = sorted_left.zip(sorted_right)

total_distance = pairs.inject(0) { |sum, pair| sum + (pair[0] - pair[1]).abs }

puts total_distance
