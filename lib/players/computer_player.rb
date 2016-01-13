require_relative 'player'
require 'computer_move'

class ComputerPlayer < Player

  include MultiThreading

  def pick_spot(board)
    multi_threading(board)
  end

end
