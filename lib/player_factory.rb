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
    current_players = players_array
    user_choice = nil
    while !valid_choice?(user_choice)
      @output.print(@view.starting_player(current_players))
      user_choice = @input.get_user_input
      if user_choice == '1'
        break
      elsif user_choice == '2'
        current_players = current_players.reverse
        break
      else
        @output.print(@view.invalid_entry)
        user_choice = nil
      end
    end
    current_players
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

  def valid_choice?(choice)
    ['1', '2'].include?(choice)
  end

end


# input = UserInterface.new
# view = View.new
# output = Output.new
# setup = GameSetup.new(input, output, view)
# info = PlayerInfo.new(input, output, view, setup)
# factory = PlayerFactory.new(info, input, output, view)
# p factory.players