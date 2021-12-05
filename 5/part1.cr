struct Point
  property x, y

  def initialize(@x : Int32, @y : Int32)
  end

  def to_s
    [x, y].join(",")
  end
end

struct Line
  property p1, p2

  def initialize(@p1 : Point, @p2 : Point)
  end

  def max_x
    [p1.x, p2.x].max
  end

  def min_x
    [p1.x, p2.x].min
  end

  def max_y
    [p1.y, p2.y].max
  end

  def min_y
    [p1.y, p2.y].min
  end

  def horizontal?
    p1.y == p2.y
  end

  def vertical?
    p1.x == p2.x
  end

  def horizontal_or_vertical?
    horizontal? || vertical?
  end

  def points
    if horizontal?
      (min_x..max_x).map do |x|
        Point.new(x: x, y: p1.y)
      end
    elsif vertical?
      (min_y..max_y).map do |y|
        Point.new(x: p1.x, y: y)
      end
    else
      # do nothing yet
      Array(Point).new
    end
  end
end

lines = [] of Line

File.read_lines("input.txt").each do |input_row|
  coordinates = input_row.split(" -> ")
  x1, y1 = coordinates.first.split(",")
  x2, y2 = coordinates.last.split(",")
  lines << Line.new(Point.new(x1.to_i, y1.to_i), Point.new(x2.to_i, y2.to_i))
end

grid = Hash(String, Int32).new(0)
lines.each do |line|
  next unless line.horizontal_or_vertical?
  line.points.each do |point|
    grid[point.to_s] += 1
  end
end

puts grid.values.select { |v| v > 1 }.size
