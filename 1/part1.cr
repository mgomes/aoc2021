depths = File.read_lines("input.txt")

increases = 0
previous_depth = Int32::MAX

depths.each do |depth|
  depth = depth.to_i

  if depth > previous_depth
    increases += 1
  end

  previous_depth = depth
end

puts increases
