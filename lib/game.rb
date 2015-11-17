require 'board'

class Game

  def initialize(size = 3)
    @board = Board.new(size)
  end

  def size
    @board.surface.length
  end

end