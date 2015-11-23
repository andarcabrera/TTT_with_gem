class HumanPlayer

  attr_reader :marker, :name

  def initialize(player_info, input, output, view)
    @name = player_info[0]
    @marker = player_info[1]
    @input = input
    @output = output
    @view = view
  end

  def pick_spot(board)
    @output.print(@view.move_prompt(self))
    spot = @input.get_user_input
    until board.available_spots.include?(spot)
      @output.print(@view.invalid_entry)
      spot = @input.get_user_input
    end
    spot
  end


end