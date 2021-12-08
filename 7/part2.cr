def calculate_cost(pos1, pos2)
  delta = (pos1 - pos2).abs
  (delta * delta + delta) // 2
end

positions = File.read("input.txt").split(",").map(&.to_i).sort

cur_pos = 0
cost = Int32::MAX
loop do
  cur_cost = positions.map { |pos| calculate_cost(pos, cur_pos) }.sum
  if cur_cost > cost
    cur_pos -= 1
    break
  else
    cost = cur_cost
    cur_pos += 1
  end
end

puts "Cost: #{cost}, Position: #{cur_pos}"
