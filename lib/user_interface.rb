class UserInterface

  def initialize(input, output, view)
    @input = input
    @output = output
    @view = view
  end

  def get_spot
    @output.print(@view.move_prompt)
    spot = @input.get_user_input
  end

  def error
    @output.print(@view.invalid_entry_spot)
  end
end

