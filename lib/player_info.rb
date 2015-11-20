class PlayerInfo

  def initialize(input, output, view, setup)
    @input = input
    @output = output
    @view = view
    @setup = setup
  end

  def player_info
    [human_player_info, human_player_info]
  end

  private

  def human_player_info
    name = ask_for_name
    marker = ask_for_marker(name)
    [name, marker]
  end

  def ask_for_name
    @output.print(@view.ask_for_name)
    @input.get_user_input
  end

  def ask_for_marker(name)
    @output.print(@view.ask_for_marker(name))
    @input.get_user_input
  end

  def game_type
    @setup.select_game_type
  end
end