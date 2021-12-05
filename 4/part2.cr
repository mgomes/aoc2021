def winning_boards(boards : Array(Array(Array(Int32))), existing_winners : Array(Int32)) : Array(Int32)
  winners = [] of Int32

  boards.each_with_index do |board, board_index|
    next if existing_winners.includes?(board_index)

    # Check rows
    board.each do |board_row|
      winners << board_index if board_row.reject { |el| el < 0 }.empty?
    end

    # Check columns
    5.times.each do |col|
      column_vals = board.map { |board_row| board_row[col] }
      winners << board_index if column_vals.reject { |el| el < 0 }.empty?
    end
  end

  winners
end

def mark_boards(boards : Array(Array(Array(Int32))), drawn_number : Int32)
  boards.each_with_index do |board, board_index|
    board.each do |board_row|
      board_row.each_with_index do |el, i|
        if el == drawn_number
          board_row[i] = -1
        end
      end
    end
  end
end

def board_total(board : Array(Array(Int32))) : Int32
  board.map { |board_row| board_row.reject { |el| el < 0 }.sum }.sum
end

input_rows = File.read_lines("input.txt")

drawn_numbers = input_rows.shift.split(",").map(&.to_i)

boards = [] of Array(Array(Int32))
board = [] of Array(Int32)
input_rows.each do |input_row|
  # the start of a new board
  if input_row.blank?
    board = [] of Array(Int32)
    next
  end

  row = input_row.split(" ").reject { |el| el.blank? }.map(&.to_i)
  board << row
  boards << board if board.size == 5
end

# Draw the numbers
winners = [] of Int32
drawn_numbers.each do |drawn_number|
  mark_boards(boards, drawn_number)
  new_winners = winning_boards(boards, winners)

  if new_winners.any?
    winners += new_winners
    new_winners.each do |winner|
      total = board_total(boards[winner])
      puts "Winner -> Board Index: #{winner}; Board Total: #{total} * #{drawn_number} = #{total * drawn_number}"
    end
  end
end
