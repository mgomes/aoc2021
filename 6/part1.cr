class Breeder
  property fishes

  def initialize(initial_states : String)
    @fishes = Array(LanternFish).new
    initial_states.split(",").each do |fish_state|
      @fishes << LanternFish.new(time_to_breed: fish_state.to_i)
    end
  end

  def next_day
    new_fishes = Array(LanternFish).new
    @fishes.each do |fish|
      if fish.ready_to_breed?
        new_fishes << fish.breed!
      else
        fish.age!
      end
    end
    @fishes += new_fishes
  end

  def population
    @fishes.size
  end

  def to_s
    fishes.map(&.to_s).join(",")
  end
end

class LanternFish
  INITIAL_BREED_TIME = 8
  NORMAL_BREED_TIME  = 6

  getter time_to_breed

  def initialize(@time_to_breed : Int32)
  end

  def age!
    @time_to_breed -= 1
  end

  def ready_to_breed?
    @time_to_breed == 0
  end

  def breed!
    @time_to_breed = NORMAL_BREED_TIME
    LanternFish.new(time_to_breed: INITIAL_BREED_TIME)
  end

  def to_s
    @time_to_breed.to_s
  end
end

initial_fish_states = File.read("input.txt")
breeder = Breeder.new(initial_fish_states)

80.times do |day|
  breeder.next_day
  # puts "After #{day + 1} days: #{breeder.to_s}"
end

puts "Total: #{breeder.population}"
