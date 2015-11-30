module AlphaBetaMinimax
  def alpha_beta_minimax(board, depth = 0, alpha = - Float::INFINITY, beta = Float::INFINITY)
    return board.available_spots.sample if board.available_spots.count >= 13 && board.size == 16
    return '4' if board.available_spots.count == 9 && board.size == 9
    if board.next_marker == self.marker
      alpha_beta_max(board, depth, alpha, beta)
    else
      alpha_beta_min(board, depth, alpha, beta)
    end
  end

  def alpha_beta_max(board, depth, alpha, beta)
    best_score = {}

    return 0 if board.tied_board?
    return -1 if board.solved_board?

    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, board.next_marker)
        best_score[available_spot.to_i] = alpha_beta_minimax(board, depth + 1, alpha, beta)
        if best_score[available_spot.to_i] > alpha
          alpha = best_score[available_spot.to_i]
        end
        if alpha >= beta
          reset_spot(board, available_spot)
          return alpha
        end
       reset_spot(board, available_spot)
    end

    best_spot = best_score.max_by { |key, value| value }[0].to_s
    max_score = best_score.max_by { |key, value| value }[1].to_i

    depth == 0 ? best_spot : max_score
  end

  def alpha_beta_min(board, depth, alpha, beta)
    best_score = {}

    return 0 if board.tied_board?
    return 1 if board.solved_board?

    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, board.next_marker)
        best_score[available_spot.to_i] = alpha_beta_minimax(board, depth + 1, alpha, beta)
        if best_score[available_spot.to_i] < beta
          beta = best_score[available_spot.to_i]
        end
        if beta <= alpha
          reset_spot(board, available_spot)
          return beta
        end
      reset_spot(board, available_spot)
    end

    best_spot = best_score.min_by { |key, value| value }[0].to_s
    min_score = best_score.min_by { |key, value| value }[1].to_i

    depth == 0 ? best_spot : min_score
  end
end