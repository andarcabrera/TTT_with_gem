class BoardSetup

  def initialize(input, output, view)
    @input = input
    @output = output
    @view = view
  end

  def board_size
    @output.print(@view.welcome)
    selection == '1' ? 9 : 16
  end

  private

  def selection
    user_choice = nil
    while !valid_choice?(user_choice)
      @output.print(@view.ask_for_board_setup)
      user_choice = @input.get_user_input
      if user_choice == '1'
        break
      elsif user_choice == '2'
        break
      else
        @output.print(@view.invalid_entry)
        user_choice = nil
      end
    end
    user_choice
  end

  def valid_choice?(choice)
    ['1', '2'].include?(choice)
  end

end