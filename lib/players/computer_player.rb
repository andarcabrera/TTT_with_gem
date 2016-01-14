require_relative 'player'
require 'computer_move'

class ComputerPlayer < Player

  def pick_spot(board)
    ComputerMove.computer_move(board)
  end

end
