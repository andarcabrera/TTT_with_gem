require 'rspec'
require 'spec_helper'
require_relative '../lib/view'

describe View do

  let(:view) { View.new }

  describe "#move_prompt" do
    it 'displays a move_prompt' do
      expect(view.move_prompt).to eq("Please select your spot")
    end
  end

  describe "#invalid spot" do
    it 'displays an invalid spot warning' do
      expect(view.invalid_spot).to eq("That is not a valid spot. Please select another one.")
    end
  end

  describe "#ask_for_name" do
    it 'requests player_name' do
      expect(view.ask_for_name).to eq("Enter player name.")
    end
  end

  describe "#ask_for_marker" do
    it 'requests player marker' do
      expect(view.ask_for_marker("Anda")).to eq("Enter marker for player Anda.")
    end
  end

  describe "#select_game_type" do
    it 'displays select game type message' do
      expect(view.select_game_type).to eq("\nEnter corresponding number to select game type:\n\n1. \t Human vs. Human\n2. \t Human vs. Computer\n3. \t Computer vs. Computer")
    end
  end

  describe "#board_to_s" do
    it 'displays the board' do
      board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
      expect(view.board_to_s(board).count).to eq(3)
      expect(view.board_to_s(board)).to include("|_0_|_1_|_2_|", "|_3_|_4_|_5_|", "|_6_|_7_|_8_|")
    end
  end
end