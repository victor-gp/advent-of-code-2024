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

similarity_score = 0
i = 0
j = 0
while sorted_left[i] && sorted_right[j] do
  if sorted_left[i] < sorted_right[j]
    i += 1
  elsif sorted_left[i] > sorted_right[j]
    j += 1
  else
    matching_id = sorted_left[i]
    count_right = 0
    while sorted_right[j] == matching_id do
      count_right += 1
      j += 1
    end
    count_left = 0
    while sorted_left[i] == matching_id do
      count_left += 1
      i += 1
    end
    similarity_score += matching_id * count_right * count_left
  end
end

puts similarity_score
