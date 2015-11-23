class Game

  attr_reader :players

  def initialize(args)
    @board = args.fetch(:board)
    @factory = args.fetch(:factory)
    @view = args.fetch(:view)
    @output = args.fetch(:output)
    @players = @factory.players
  end

  def play_game
    show_board
    set_markers
    take_turns
  end

  def take_turns
    until game_over?
      players.each do |player|
        move(player)
        show_board
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
      spot = player.pick_spot(@board).to_i
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

  def set_surface(surface)
    @board.surface = surface
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

  def show_board
    @output.print(@view.board_to_s(playing_surface))
  end

  def set_markers
    markers = @players.map {|player| player.marker}
    @board.set_markers(markers)
  end

end