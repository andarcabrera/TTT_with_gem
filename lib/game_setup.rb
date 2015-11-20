class GameSetup

  def initialize(input)
    @input = input
  end

  def select_game_type
    @input.get_user_input
  end

end