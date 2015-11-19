class ComputerPlayer

  attr_reader :marker

  def initialize(marker, input, output, view)
    @marker = marker
    @input = input
    @output = output
    @view = view
  end

  def pick_spot(board, best_score = {})

    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, marker)
      if board.solved_board?
        best_score[available_spot] = 1
      else
        best_score[available_spot] = 0
        reset_spot(board, available_spot)
      end

      board.fill_spot(available_spot, board.next_marker(marker))
      if board.solved_board?
        best_score[available_spot] = -1
      else
        reset_spot(board, available_spot)
      end
    end

    spot = best_score.max_by { |key, value| value }[0]
  end

  def reset_spot(board, spot)
    board.fill_spot(spot, spot)
  end

end
