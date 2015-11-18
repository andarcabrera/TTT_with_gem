class View

  def board_to_s(board)
    i = 0
    while i < 8
      puts "|_" + board[i..i+2].join("_|_") + "_|"
      i += 3
    end
  end

  def move_prompt
    "Please select your spot"
  end
end