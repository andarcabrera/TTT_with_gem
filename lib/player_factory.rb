# require_relative 'input'
# require_relative 'output'
# require_relative 'view'
# require_relative 'player_info'
# require_relative 'game_setup'
# require_relative 'human_player'
# require_relative 'computer_player'

class PlayerFactory

  def initialize(input, output, view, info)
    @input = input
    @output = output
    @view = view
    @info = info
  end

  def players
    players = []
    player_info.each do |info|
      if info[0] == "computer"
        players << ComputerPlayer.new(info, @input, @output, @view)
      else
        players << HumanPlayer.new(info, @input, @output, @view)
      end
    end
    players
  end

  private

  def player_info
    @info.player_info
  end

end


# input = UserInterface.new
# view = View.new
# output = Output.new
# setup = GameSetup.new(input, output, view)
# info = PlayerInfo.new(input, output, view, setup)
# factory = PlayerFactory.new(info, input, output, view)
# p factory.players