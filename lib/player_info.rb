class PlayerInfo

  def initialize(input)
    @input = input
  end

  def player_names
    names = []
    2.times { names << ask_for_name }
    names
  end

  def ask_for_name
    @input.get_user_input
  end

  def ask_for_marker
    @input.get_user_input
  end

end