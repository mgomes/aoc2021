binary_codes = File.read_lines("input.txt")

def bin_binary_codes(binary_codes)
  bins = [] of Array(String)

  binary_codes.each do |binary_code|
    binary_code.split("").each_with_index do |digit, i|
      if bins[i]?
        bins[i] << digit
      else
        bins << [digit]
      end
    end
  end

  bins
end

digit_length = binary_codes.first.size
o2_gen_rating = co2_gen_rating = ""

# O2 Generator Rating
bins = bin_binary_codes(binary_codes)
digit_length.times do |i|
  tally = bins[i].tally
  digit = tally["1"] >= tally["0"] ? "1" : "0"
  o2_gen_rating += digit
  matches = binary_codes.select { |binary_code| binary_code.match(/^#{o2_gen_rating}/) }
  if matches.size == 1
    o2_gen_rating = matches.first
    break
  end
  bins = bin_binary_codes(matches)
end

# CO2 Generator Rating
bins = bin_binary_codes(binary_codes)
digit_length.times do |i|
  tally = bins[i].tally
  digit = tally["0"] <= tally["1"] ? "0" : "1"
  co2_gen_rating += digit
  matches = binary_codes.select { |binary_code| binary_code.match(/^#{co2_gen_rating}/) }
  if matches.size == 1
    co2_gen_rating = matches.first
    break
  end
  bins = bin_binary_codes(matches)
end

puts o2_gen_rating.to_i(2) * co2_gen_rating.to_i(2)
