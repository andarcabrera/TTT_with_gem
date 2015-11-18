require 'board'

class Game

  attr_reader :size, :markers, :players, :board

  def initialize(args)
    @size = args[:size] || 3
    @markers = args.fetch(:markers)
    @board = Board.new(markers, size)
    @players = args.fetch(:players)
  end

  def play_game
    until game_over?
      players.each do |player|
        move(player)
        break if game_over?
      end
    end
  end

  def move(player)
    player_marker = player.marker
    spot = pick_spot(player)
    fill_spot(spot, player_marker)
  end

  def pick_spot(player)
    spot = nil
    until spot
      spot = player.pick_spot.to_i
      if permitted_move(spot)
        spot
      else
        spot = nil
      end
    end
    spot
  end

  def playing_surface
    @board.surface
  end

  def game_over?
    @board.solved_board? != nil || @board.tied_board?
  end

  private

  def fill_spot(spot, marker)
    @board.fill_spot(spot, marker)
  end

  def permitted_move(spot)
    @board.available_spot(spot)
  end

end