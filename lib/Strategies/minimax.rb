module Minimax
  def minimax(board, depth = 0)
    return '4' if board.available_spots.count == 9
    if board.next_marker == self.marker
      minimax_max(board, depth)
    else
      minimax_min(board, depth)
    end
  end

  def minimax_max(board, depth)
    best_score = {}

    return 0 if board.tied_board?
    return -1 if board.solved_board?

    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, board.next_marker)
      best_score[available_spot.to_i] = minimax(board, depth + 1)
      reset_spot(board, available_spot)
    end

    best_spot = best_score.max_by { |key, value| value }[0].to_s
    max_score = best_score.max_by { |key, value| value }[1].to_i

    depth == 0 ? best_spot : max_score
  end

  def minimax_min(board, depth)
    best_score = {}

    return 0 if board.tied_board?
    return 1 if board.solved_board?

    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, board.next_marker)
      best_score[available_spot.to_i] = minimax(board, depth + 1)
      reset_spot(board, available_spot)
    end

    best_spot = best_score.min_by { |key, value| value }[0].to_s
    min_score = best_score.min_by { |key, value| value }[1].to_i

    depth == 0 ? best_spot : min_score
  end
end