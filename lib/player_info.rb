class PlayerInfo

  def initialize(input)
    @input = input
  end

  def ask_for_name
    @input.get_user_input
  end

  def ask_for_marker
    @input.get_user_input
  end

end