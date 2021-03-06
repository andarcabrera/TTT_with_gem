class PlayerInfo

  def initialize(input, output, view, setup)
    @input = input
    @output = output
    @view = view
    @setup = setup
    @markers = []
  end

  def player_info
    case game_type
    when '1'
      [human_player_info, human_player_info]
    when '2'
      [human_player_info, computer_player_info]
    when '3'
      [computer_player_info, computer_player_info]
    end
  end

  private

  def human_player_info
    name = ask_for_name
    marker = ask_for_marker(name)
    [name, marker]
  end

  def computer_player_info
    name = 'computer'
    marker = ask_for_marker(name)
    [name, marker]
  end

  def ask_for_name
    @output.print(@view.ask_for_name)
    name = @input.get_user_input
    until name != ""
      @output.print(@view.invalid_entry_name)
      name = @input.get_user_input
    end
    name
  end

  def ask_for_marker(name)
    @output.print(@view.ask_for_marker(name))
    marker = nil
    while marker.nil?
      marker = @input.get_user_input
      if valid_marker?(marker)
        @markers << marker
      else
        marker = nil
        @output.print(@view.invalid_entry_marker)
      end
    end
    marker
  end

  def game_type
    @setup.select_game_type
  end

  def valid_marker?(marker)
    !@markers.include?(marker) && marker != ""
  end
end



# info = PlayerInfo.new(input, output, view, setup)
# p info.player_info