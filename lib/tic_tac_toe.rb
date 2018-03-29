WIN_COMBINATIONS = [
  [0, 1, 2], #toprow
  [3, 4, 5], #middlerow
  [6, 7, 8], #bottomrow
  [0, 3, 6], #column1
  [1, 4, 7], #column2
  [2, 5, 8], #column3
  [0, 4, 8], #diagonal1
  [2, 4, 6]  #diagonal2
]

def display_board(board)
  print " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} \n"
  print "-----------\n"
  print " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} \n"
  print "-----------\n"
  print " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} \n"
end

def input_to_index(input)
  input_one = input.to_i
  input_two = input_one - 1
  return input_two
end

def move(array, index, value)
  array[index] = value
end

def position_taken?(board, index)
  if board[index] == nil
    false
  elsif board[index].strip == ""
    false
  else
    true
  end
end

def valid_move?(board, index)
  val = index.to_i
  if val < 0 || val > 8
    false
  elsif position_taken?(board, index) == true
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  winning_combo = 0
  WIN_COMBINATIONS.each do |combo_array|
    win_index_1 = combo_array[0]
    win_index_2 = combo_array[1]
    win_index_3 = combo_array[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winning_combo = combo_array
      winning_person = "X"

    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winning_combo = combo_array
      winning_person = "O"
    end
  end
  if winning_combo != 0
    return winning_combo
  else
    return false
  end
end

def full?(board)
  all_full = board.all? do |value|
    value.include?("X") || value.include?("O")
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false
    return true
  elsif draw?(board) == true
    return true
  else
    return false
  end
end



def winner_function(board)
  winning_combo = 0
  winning_person = 0
  WIN_COMBINATIONS.each do |combo_array|
    win_index_1 = combo_array[0]
    win_index_2 = combo_array[1]
    win_index_3 = combo_array[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      winning_combo = combo_array
      winning_person = "X"

    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      winning_combo = combo_array
      winning_person = "O"
    end
  end
  if winning_combo != 0
    return winning_person
  else
    return false
  end
end

def winner(board)
  store_person = winner_function(board)
  store_combo = won?(board)
  if store_combo == false
    return nil
  elsif store_person == "X"
    return "X"
  elsif store_person == "O"
    return "O"
  else
    return false
  end
end
