class Player

  attr_reader :marker, :name

  def initialize(player_info, input, output, view)
    @name = player_info[0]
    @marker = player_info[1]
    @input = input
    @output = output
    @view = view
  end
end