class View

  def board_to_s(board)
    i = 0
    row_length = Math.sqrt(board.length).to_i
    array = []
    while i < board.length
       array << "|_" + board[i..i+row_length-1].join("_|_") + "_|"
      i += row_length
    end
    array
  end

  def move_prompt
    "Please select your spot"
  end

  def invalid_spot
    "That is not a valid spot. Please select another one."
  end

  def select_game_type
    "Enter corresponding number to select game type."
  end
end