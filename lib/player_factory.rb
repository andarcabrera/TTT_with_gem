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
    case starting_player
    when 'y'
      players_array
    when 'n'
      players_array.reverse
    end
  end

  private

  def players_array
    players_array = []
    player_info.each do |info|
      if info[0] == "computer"
        players_array << ComputerPlayer.new(info, @input, @output, @view)
      else
        players_array << HumanPlayer.new(info, @input, @output, @view)
      end
    end
    players_array
  end

  def player_info
    @info.player_info
  end

  def starting_player
    player = players_array[0]
    @output.print(@view.starting_player(player))
    user_choice = @input.get_user_input
    until user_choice == 'y' || 'n'
      @output.print(@view.starting_player(player))
      user_choice = @input.get_user_input
    end
    user_choice
  end

end


# input = UserInterface.new
# view = View.new
# output = Output.new
# setup = GameSetup.new(input, output, view)
# info = PlayerInfo.new(input, output, view, setup)
# factory = PlayerFactory.new(info, input, output, view)
# p factory.players