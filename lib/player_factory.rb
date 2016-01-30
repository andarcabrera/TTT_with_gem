require 'ttt'
require_relative 'user_interface'

class PlayerFactory

  def initialize(input, output, view, info)
    @input = input
    @output = output
    @view = view
    @info = info
  end

  def players
    @output.print(@view.welcome)
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
        @output.print(@view.invalid_entry_player_order)
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
        players_array << TTT::ComputerPlayer.new(info[0], info[1])
      else
        players_array << TTT::HumanPlayer.new(info[0], info[1], UserInterface.new(@input, @output, @view))
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


