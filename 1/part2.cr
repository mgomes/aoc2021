depths = File.read_lines("input.txt")

windows = Hash(Int32, Int32).new

def store_depth_window(windows, window, depth)
  if windows.has_key?(window)
    windows[window] += depth
  else
    windows[window] = depth
  end
end

i = 0
depths.each do |depth|
  depth = depth.to_i
  w1 = i
  w2 = i - 1
  w3 = i - 2

  store_depth_window(windows, w1, depth) if w1 >= 0
  store_depth_window(windows, w2, depth) if w2 >= 0
  store_depth_window(windows, w3, depth) if w3 >= 0

  i += 1
end

increases = 0
previous_depth = Int32::MAX

windows.each do |window, depth|
  if depth > previous_depth
    increases += 1
  end

  previous_depth = depth
end

puts increases
