require 'board'

class Game

  attr_reader :players

  def initialize(size = 3)
    @board = Board.new(size)
    @players = []
  end

  def size
    @board.surface.length
  end

  def add_player(player)
    players << player
  end
end