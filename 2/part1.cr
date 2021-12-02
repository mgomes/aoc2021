x = 0
depth = 0

File.read_lines("input.txt").each do |commands|
  command, magnitude = commands.split(" ")
  magnitude = magnitude.to_i

  case command
  when "up"
    depth -= magnitude
  when "down"
    depth += magnitude
  when "forward"
    x += magnitude
  end
end

puts x * depth
