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

similarity_score = 0
i = 0
j = 0
while sorted1[i] && sorted2[i] do
  if sorted1[i] < sorted2[j]
    i += 1
  elsif sorted1[i] > sorted2[j]
    j += 1
  else
    matching_id = sorted1[i]
    count2 = 0
    while sorted2[j] == matching_id do
      j += 1
      count2 += 1
    end
    count1 = 0
    while sorted1[i] == matching_id do
      i += 1
      count1 += 1
    end
    similarity_score += matching_id * count2 * count1
  end
end

puts similarity_score
