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
    @input.get_user_input
  end


end