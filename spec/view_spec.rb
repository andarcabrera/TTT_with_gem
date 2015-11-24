require 'rspec'
require 'spec_helper'
require_relative '../lib/view'

describe View do

  let(:view) { View.new }

  describe "#move_prompt" do
    it 'displays a move_prompt' do
      player = double('player', :name => "Anda")
      expect(view.move_prompt(player)).to eq("Please select your spot, Anda.")
    end
  end

  describe "#invalid_entry" do
    it 'displays an invalid spot warning' do
      expect(view.invalid_entry).to eq("That is not a valid entry. Please select a valid entry.")
    end
  end

  describe "#ask_for_name" do
    it 'requests player_name' do
      expect(view.ask_for_name).to eq("Enter human player name.")
    end
  end

  describe "#ask_for_marker" do
    it 'requests player marker' do
      expect(view.ask_for_marker("Anda")).to eq("Enter marker for player = Anda.")
    end
  end

  describe "#welcome" do
    it 'returns welcome message' do
      expect(view.welcome).to eq("    .___________. __    ______    .___________.    ___       ______
    |           ||  |  /      |   |           |   /   \     /      |
    `---|  |----`|  | |  ,----'   `---|  |----`  /  ^  \   |  ,----'
        |  |     |  | |  |            |  |      /  /_\  \  |  |
        |  |     |  | |  `----.       |  |     /  _____  \ |  `----.
        |__|     |__|  \______|       |__|    /__/     \__\ \______|

                   .___________.  ______    _______
                   |           | /  __  \  |   ____|
                   `---|  |----`|  |  |  | |  |__
                       |  |     |  |  |  | |   __|
                       |  |     |  `--'  | |  |____
                       |__|      \______/  |_______|   ")
    end
  end

  describe "#winner_message" do
    it 'announces the winner' do
      player = double('player', :name => "Anda")

      expect(view.winner_message(player)).to eq("Anda won the game!")
    end
  end

  describe "#tied_message" do
    it 'announces the game ended in a tie' do

      expect(view.tied_message).to eq("Game ended in a tie.")
    end
  end

  describe "#spot_selection" do
    it 'announces the spot selected' do
      player = double('player', :name => "Anda")
      spot = '1'

      expect(view.spot_selection(player, spot)).to eq("Anda selected spot # 1")
    end
  end

  describe "#starting_player" do
    it 'asks for confirmation of starting player' do
      player1 = double('player1', :name => "Anda")
      player2 = double('player2', :name => "Eli")
      players = [player1, player2]

      expect(view.starting_player(players)).to eq("Enter corresponding number to select players order:\n1.\tAnda\n2.\tEli")
    end
  end

  describe "#select_game_type" do
    it 'displays select game type message' do
      expect(view.select_game_type).to eq("\nEnter corresponding number to select game type:\n\n1. \t Human vs. Human\n2. \t Human vs. Computer\n3. \t Computer vs. Computer")
    end
  end

  describe "#ask_for_board_setup" do
    it 'displays select board size message' do
      expect(view.ask_for_board_setup).to eq("\nEnter corresponding number to select board size:\n\n1. \t 3X3 board\n2. \t 4X4 board\n")
    end
  end

  describe "#board_to_s" do
    it 'displays the board' do
      board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      expect(view.board_to_s(board).count).to eq(3)
      expect(view.board_to_s(board)).to include("_0_|_1_|_2_", "_3_|_4_|_5_", "_6_|_7_|_8_")
    end
  end

  describe "#dotted_line" do
    it 'print a dotted line' do
      expect(view.dotted_line).to eq("----------------------")
    end
  end
end