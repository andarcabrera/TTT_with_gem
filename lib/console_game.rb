require 'benchmark'
require 'ttt_db'

class ConsoleGame

  attr_reader :players

  def initialize(args)
    @ttt_game = args.fetch(:ttt_game)
    @input = args.fetch(:input)
    @output = args.fetch(:output)
    @view = args.fetch(:view)
  end

  def play_game
    show_board
    take_turns
    announce_winner
  end

  def take_turns
    until @ttt_game.game_over?
        spot = @ttt_game.make_move
        show_board
        dotted_line
        @output.print(@view.spot_selection(previous_player_name, spot))
        break if @ttt_game.game_over?
    end
  end

  def playing_surface
    @ttt_game.current_state
  end

  private

  def previous_player_name
    @ttt_game.previous_player.name
  end

  def show_board
    @output.print(@view.board_to_s(playing_surface))
  end

  def announce_winner
    if @ttt_game.game_winner
      @output.print(@view.winner_message(@ttt_game.game_winner))
    else
      @output.print(@view.tied_message)
    end
  end

  def dotted_line
    @output.print(@view.dotted_line)
  end

end
