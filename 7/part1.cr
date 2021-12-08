positions = File.read("input.txt").split(",").map(&.to_i).sort

cur_pos = 0
cost = Int32::MAX
loop do
  cur_cost = positions.map { |pos| (pos - cur_pos).abs }.sum
  if cur_cost > cost
    cur_pos -= 1
    break
  else
    cost = cur_cost
    cur_pos += 1
  end
end

puts "Cost: #{cost}, Position: #{cur_pos}"
