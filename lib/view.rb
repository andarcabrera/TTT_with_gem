class View

  def board_to_s(board)
    i = 0
    row_length = Math.sqrt(board.length).to_i
    array = [""]
    while i < board.length
      array << "_|"  + "___|_" * (row_length - 1) + "___|_"
      line = board[i..i+row_length-1].map do |spot|
        if spot.to_i < 10
          " " + spot.to_s + " | "
        elsif spot.to_i >= 10
          spot.to_s + " | "
        end
      end
        array << " |" + line.join("")
      i += row_length
    end
    array << "_|"  + "___|_" * (row_length - 1) + "___|_"
    array << ""
    array
  end

  def welcome
    "    .___________. __    ______    .___________.    ___       ______
    |           ||  |  /      |   |           |   /   \     /      |
    `---|  |----`|  | |  ,----'   `---|  |----`  /  ^  \   |  ,----'
        |  |     |  | |  |            |  |      /  /_\  \  |  |
        |  |     |  | |  `----.       |  |     /  _____  \ |  `----.
        |__|     |__|  \______|       |__|    /__/     \__\ \______|

                   .___________.  ______    _______
                   |           | /  __  \  |   ____|
                   `---|  |----`|  |  |  | |  |__
                       |  |     |  |  |  | |   __|
                       |  |     |  `--'  | |  |____
                       |__|      \______/  |_______|   "
  end

  def move_prompt
    "Please select your spot."
  end

  def invalid_entry_spot
    "That is an invalid spot. Please select an available spot."
  end

  def invalid_entry_board_size
    "That is not a valid entry. Please select option 1 or 2 and press enter."
  end

  def invalid_entry_game_type
    "That is not a valid entry. Please select option 1, 2 or 3 and press enter."
  end

  def invalid_entry_name
    "That is not a valid entry. Please enter player name."
  end

  def invalid_entry_marker
    "That is not a valid entry. Please select a valid marker."
  end

  def invalid_entry_player_order
    "That is not a valid entry. Please select option 1 or 2 and press enter."
  end

  def ask_for_name
    "Enter human player name."
  end

  def ask_for_marker(name)
    "Enter marker for player = #{name.capitalize}."
  end

  def select_game_type
    "\nEnter corresponding number to select game type:\n\n1. \t Human vs. Human\n2. \t Human vs. Computer\n3. \t Computer vs. Computer"
  end

  def ask_for_board_setup
    "\nEnter corresponding number to select board size:\n\n1. \t 3X3 board\n2. \t 4X4 board\n"
  end

  def starting_player(players)
    "Enter corresponding number to select players order:\n1.\t#{players[0][:name].capitalize}\n2.\t#{players[1][:name].capitalize}"
  end

  def spot_selection(player, spot)
    "#{player.name.capitalize} selected spot # #{spot.to_i}"
  end

  def winner_message(winner)
    "#{winner.name.capitalize} won the game!"
  end

  def tied_message
    "Game ended in a tie."
  end

  def dotted_line
    "----------------------"
  end
end

