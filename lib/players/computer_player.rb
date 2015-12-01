require_relative 'player'
# require_relative '../strategies/minimax'
# require_relative '../strategies/alpha_beta_minimax'
# require_relative '../strategies/negamax'
require_relative '../strategies/alpha_beta_negamax'
require_relative '../strategies/multi-threading'

class ComputerPlayer < Player
  # include Minimax
  # include AlphaBetaMinimax
  # include Negamax
  include AlphaBetaNegamax
  include MultiThreading

  def pick_spot(board)
    multi_threading(board)
  end

  # def pick_spot(board)
  #   alpha_beta_negamax(board, depth = 0)
  # end

  # def pick_spot(board)
  #   alpha_beta_minimax(board, depth = 0)
  # end

  private

  def reset_spot(board, spot)
    board.fill_spot(spot, spot)
  end

end
