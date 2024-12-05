# https://adventofcode.com/2024/day/3

MUL_REGEX =  /mul\(\d{1,3},\d{1,3}\)/
# same regex but captures the variables
VARS_REGEX = /mul\((\d{1,3}),(\d{1,3})\)/

def part1()
  program_memory = STDIN.read
  valid_instructions = program_memory.scan(MUL_REGEX)
  result = valid_instructions.inject(0) do |sum, ins|
    vars = VARS_REGEX.match(ins).captures
    x, y = vars.map(&:to_i)
    sum + x*y
  end
  puts result
end

INS_REGEX = /mul\(\d{1,3},\d{1,3}\)|do\(\)|don't\(\)/

def part2()
  program_memory = STDIN.read
  valid_instructions = program_memory.scan(INS_REGEX)
  enabled = true
  result = valid_instructions.inject(0) do |sum, ins|
    case ins
    when "do()"
      enabled = true
      sum
    when "don't()"
      enabled = false
      sum
    else # "mul(..)"
      next sum unless enabled
      vars = VARS_REGEX.match(ins).captures
      x, y = vars.map(&:to_i)
      sum + x*y
    end
  end
  puts result
end

case ENV["AOC_PART"] || ENV["PART"]
when "1"
  part1()
when "2"
  part2()
else
  puts "no part defined!"
  puts "use AOC_PART (exported) or PART (inline) environment variables"
end
