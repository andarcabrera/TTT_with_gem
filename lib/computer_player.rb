class ComputerPlayer

  attr_reader :marker

  def initialize(marker, input, output, view)
    @marker = marker
    @input = input
    @output = output
    @view = view
  end

  def pick_spot(board)
    spot = nil
    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, marker)
      if board.solved_board? != nil
        spot = available_spot
        return spot
      else
        board.fill_spot(available_spot, available_spot)
        spot = nil
      end
      board.fill_spot(available_spot.to_i, board.next_marker(marker))
      if board.solved_board? != nil
        spot = available_spot
        return spot
      else
        board.fill_spot(available_spot, available_spot)
        spot = nil
      end
    end
    spot
  end


end
