class Breeder
  INITIAL_BREED_TIME = 8
  NORMAL_BREED_TIME  = 6

  property fishes

  def initialize(initial_states : String)
    @fishes = Hash(Int32, UInt64).new(0_u64)
    initial_states.split(",").each do |fish_state|
      @fishes[fish_state.to_i] += 1
    end
  end

  def next_day
    new_fish_count = @fishes[0]
    (1..8).each do |i|
      @fishes[i - 1] = @fishes[i]
    end
    @fishes[8] = new_fish_count
    @fishes[6] += new_fish_count
  end

  def population
    @fishes.values.sum
  end
end

initial_fish_states = File.read("input.txt")
breeder = Breeder.new(initial_fish_states)

256.times do |day|
  breeder.next_day
end

puts "Total: #{breeder.population}"
