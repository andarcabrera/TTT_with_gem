require_relative 'player'

class ComputerPlayer < Player

  def pick_spot(board)
    TTT::ComputerMove.computer_move(board)
  end

end
