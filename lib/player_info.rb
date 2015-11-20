class PlayerInfo

  def initialize(input, output, view, setup)
    @input = input
    @output = output
    @view = view
    @setup = setup
  end

  def ask_for_name
    @output.print(@view.ask_for_name)
    @input.get_user_input
  end

  def ask_for_marker(name)
    @output.print(@view.ask_for_marker(name))
    @input.get_user_input
  end
end