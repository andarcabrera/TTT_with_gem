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

  def welcome
    "Welcome to TDD TTT."
  end

  def move_prompt
    "Please select your spot"
  end

  def invalid_spot
    "That is not a valid spot. Please select another one."
  end

  def ask_for_name
    "Enter player name."
  end

  def ask_for_marker(name)
    "Enter marker for player #{name}."
  end

  def select_game_type
    "\nEnter corresponding number to select game type:\n\n1. \t Human vs. Human\n2. \t Human vs. Computer\n3. \t Computer vs. Computer"
  end
end

