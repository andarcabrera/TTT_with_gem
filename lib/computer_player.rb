class ComputerPlayer

  attr_reader :marker

  def initialize(marker, input, output, view)
    @marker = marker
    @input = input
    @output = output
    @view = view
  end

  def pick_spot(board)
    @output.print(@view.computer_thinking)
    spot = nil
    board.available_spots.each do |available_spot|
      board.fill_spot(available_spot, marker)
      if board.solved_board? != nil
        spot = available_spot
        return spot
      end
      board.fill_spot(available_spot.to_i, spot)
      spot = nil
      board.fill_spot(available_spot.to_i, board.next_marker(marker))
      if board.solved_board? != nil
        spot = available_spot
        return spot
      end
    end

    if spot = nil
      spot = available_spots.sample.to_i
    else
      spot
    end

    spot
  end


end