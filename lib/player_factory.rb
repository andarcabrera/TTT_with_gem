require 'pry'

class PlayerFactory

  def initialize(info, input, output, view)
    @info = info
    @input = input
    @output = output
    @view = view
  end

  def players
    players = []
    player_info.each { |player_info| players << HumanPlayer.new(player_info, @input, @output, @view)}
    players
  end

  def player_info
    @info.player_info
  end

end