class GameSetup

  def initialize(input, output, view)
    @input = input
    @output = output
    @view = view
  end

  def select_game_type
    @output.print(@view.select_game_type)
    selection = nil
    until valid_selection?(selection)
      selection = @input.get_user_input
      if !valid_selection?(selection)
        @output.print(@view.invalid_entry)
      end
    end
    selection
  end

  def valid_selection?(selection)
    ['1', '2', '3'].include?(selection)
  end
end