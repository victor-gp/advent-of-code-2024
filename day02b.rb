# https://adventofcode.com/2024/day/2

reports = []
STDIN.each_line do |line|
  reports << line.split.map(&:to_i)
end

def safe?(report)
  recursive_safe?(report, 0, 1, true, false) ||
    recursive_safe?(report, 1, 2, true, true) ||
    recursive_safe?(report, 0, 1, false, false) ||
    recursive_safe?(report, 1, 2, false, true)
end

def recursive_safe?(report, i, j, is_increasing, already_dampened)
  return true if j == report.length

  safe_step = safe_step?(report[j], report[i], is_increasing)
  if safe_step
    return true if recursive_safe?(report, j, j+1, is_increasing, already_dampened)
  end
  if !already_dampened
    return recursive_safe?(report, i, j+1, is_increasing, true)
  end

  false
end

def safe_step?(level, previous_level, is_increasing)
  unsafe =
    level < previous_level && is_increasing ||
    level > previous_level && !is_increasing ||
    level == previous_level || # difference < 1
    (previous_level - level).abs > 3
  return !unsafe
end

reports_safety = reports.map { |r| safe?(r) }
puts reports_safety.count(true)
