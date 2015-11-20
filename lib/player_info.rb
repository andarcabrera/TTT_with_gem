class PlayerInfo

  def initialize(input)
    @input = input
  end

  def player_info
    player_names.zip(markers)
  end

  def player_names
    names = []
    2.times { names << ask_for_name }
    names
  end

  def markers
    markers = []
    until markers.count == 2
      marker = ask_for_marker
      if markers.include?(marker)
        marker = nil
      else
        markers << marker
      end
    end
    markers
  end

  def ask_for_name
    @input.get_user_input
  end

  def ask_for_marker
    @input.get_user_input
  end

end