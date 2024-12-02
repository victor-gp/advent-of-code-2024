# https://adventofcode.com/2024/day/2

reports = []
STDIN.each_line do |line|
  reports << line.split.map(&:to_i)
end

def safe?(report)
  is_increasing = report[0] < report[1]
  previous_level = report[0]
  report_slice = report.drop(1)
  report_slice.each do |level|
    return false if
      level < previous_level && is_increasing ||
      level > previous_level && !is_increasing ||
      level == previous_level || # difference < 1
      (previous_level - level).abs > 3
    previous_level = level
  end
  true
end

reports_safety = reports.map { |r| safe?(r) }
puts reports_safety.count(true)
