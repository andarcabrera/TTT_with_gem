require_relative 'player'

class HumanPlayer < Player

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