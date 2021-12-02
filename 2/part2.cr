x = depth = aim = 0

File.read_lines("input.txt").each do |commands|
  command, magnitude = commands.split(" ")
  magnitude = magnitude.to_i

  case command
  when "up"
    aim -= magnitude
  when "down"
    aim += magnitude
  when "forward"
    x += magnitude
    depth += magnitude * aim
  end
end

puts x * depth
