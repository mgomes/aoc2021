input_rows = File.read_lines("input.txt")
inputs = [] of String
outputs = [] of String
input_rows.each do |input_row|
  input, output = input_row.split(" | ")
  inputs << input
  outputs << output
end

segments_by_digit = {
  1 => 2,
  4 => 4,
  7 => 3,
  8 => 7,
}

total = 0
notable_sizes = segments_by_digit.values
outputs.each do |output|
  output.split(" ").each do |digit|
    total += 1 if notable_sizes.includes?(digit.size)
  end
end

puts total
