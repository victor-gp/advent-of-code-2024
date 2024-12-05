# https://adventofcode.com/2024/day/3

MUL_REGEX =  /mul\(\d{1,3},\d{1,3}\)/
# same regex but captures the variables
VARS_REGEX = /mul\((\d{1,3}),(\d{1,3})\)/

program_memory = STDIN.read
valid_instructions = program_memory.scan(MUL_REGEX)

result = valid_instructions.inject(0) do |sum, ins|
  vars = VARS_REGEX.match(ins).captures
  x, y = vars.map(&:to_i)
  sum + x*y
end

puts result
