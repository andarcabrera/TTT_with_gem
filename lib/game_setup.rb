class GameSetup

  def initialize(input, output, view)
    @input = input
    @output = output
    @view = view
  end

  def select_game_type
    @output.print(@view.select_game_type)
    @input.get_user_input
  end

end