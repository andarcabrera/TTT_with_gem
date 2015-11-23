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

  def move_prompt(player)
    "Please select your spot, #{player.name}."
  end

  def invalid_entry
    "That is not a valid entry. Please select a valid entry."
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

  def starting_player(players)
    "Enter corresponding number for starting player\n1.\t#{players[0].name.capitalize}\n2.\t#{players[1].name.capitalize}"
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

