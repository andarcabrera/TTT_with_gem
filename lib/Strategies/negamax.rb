module Negamax
  def negamax(board, depth = 0)
    return '4' if board.available_spots.count == 9
    best_score = {}

    return 0 if board.tied_board?
    return -1 if board.solved_board?

    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, board.next_marker)
        best_score[available_spot.to_i] = -1 * negamax(board, depth + 1)
      reset_spot(board, available_spot)
    end

    best_spot = best_score.max_by { |key, value| value }[0].to_s
    minimax_score = best_score.max_by { |key, value| value }[1].to_i

    depth == 0 ? best_spot : minimax_score
  end
end
