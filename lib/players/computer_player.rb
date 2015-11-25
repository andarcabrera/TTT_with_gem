require_relative 'player'
# require_relative '../strategies/minimax'
# require_relative '../strategies/alpha_beta_minimax'
require_relative '../strategies/negamax'
require_relative '../strategies/alpha_beta_negamax'

class ComputerPlayer < Player

  # include Minimax
  # include AlphaBetaMinimax
  include Negamax
  include AlphaBetaNegamax

  def pick_spot(board)
    if board.size == 9
      negamax(board, depth = 0)
    elsif board.size == 16
      alpha_beta_negamax(board, depth = 0)
    end
  end

  # def pick_spot(board)
  #   if board.size == 9
  #     minimax(board, depth = 0)
  #   elsif board.size == 16
  #     alpha_beta_minimax(board, depth = 0)
  #   end
  # end

  private

  def reset_spot(board, spot)
    board.fill_spot(spot, spot)
  end

end
