bins = [] of Array(String)

File.read_lines("input.txt").each do |binary_code|
  binary_code.split("").each_with_index do |digit, i|
    if bins[i]?
      bins[i] << digit
    else
      bins << [digit]
    end
  end
end

gamma_rate = epsilon_rate = ""

bins.each do |bin|
  tally = bin.tally
  if tally["1"] > tally["0"]
    gamma_rate += "1"
    epsilon_rate += "0"
  else
    gamma_rate += "0"
    epsilon_rate += "1"
  end
end

puts "gamma_rate: #{gamma_rate.to_i(2)}, epsilon_rate: #{epsilon_rate.to_i(2)}"
puts "#{gamma_rate.to_i(2) * epsilon_rate.to_i(2)}"
