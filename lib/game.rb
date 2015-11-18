require 'board'

class Game

  attr_reader :size, :markers, :players, :board

  def initialize(args)
    @size = args[:size] || 3
    @markers = args.fetch(:markers)
    @board = Board.new(markers, size)
    @player = args.fetch(:players)
  end

  def move(player)
    player_marker = player.marker
    spot = pick_spot(player)
    if permitted_move(spot)
      fill_spot(spot, player_marker)
    end
  end

  def pick_spot(player)
    player.pick_spot
  end

  def playing_surface
    @board.surface
  end

  private

  def fill_spot(spot, marker)
    @board.fill_spot(spot, marker)
  end

  def permitted_move(spot)
    @board.available_spot(spot)
  end

end