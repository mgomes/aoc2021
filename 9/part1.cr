map = File.read_lines("input.txt").map(&.chars.map(&.to_i))

def risk_level(elevation)
  elevation + 1
end

map_height = map.size
map_width = map.first.size

total = 0

map.each_with_index do |row, y|
  row.each_with_index do |position_height, x|
    lowest = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} }.all? do |dx, dy|
      tx = x + dx
      ty = y + dy
      if 0 <= tx < map_width && 0 <= ty < map_height
        map[y + dy][x + dx] > position_height
      else
        true
      end
    end

    total += risk_level(position_height) if lowest
  end
end

puts total
