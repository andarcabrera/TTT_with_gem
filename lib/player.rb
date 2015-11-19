class Player

  attr_reader :marker

  def initialize(marker, input, output, view)
    @marker = marker
    @input = input
    @output = output
    @view = view
  end

  def pick_spot(board)
    @output.print(@view.move_prompt)
    spot = @input.get_user_input
    until board.available_spots.include?(spot)
      @output.print(@view.invalid_spot)
      spot = @input.get_user_input
    end
    spot
  end


end