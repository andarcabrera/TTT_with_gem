require 'rspec'
require 'spec_helper'
require_relative '../lib/player_info'


describe PlayerInfo do

  let(:input) { double('input') }
  let(:info) { PlayerInfo.new(input) }

  describe "#ask_for_name" do
    it 'asks for player name' do
      allow(input).to receive(:get_user_input).and_return('Anda')

      expect(info.ask_for_name).to eq("Anda")
    end

    it 'asks for player name' do
      allow(input).to receive(:get_user_input).and_return('Alex')

      expect(info.ask_for_name).to eq("Alex")
    end

    it 'asks for player marker' do
      allow(input).to receive(:get_user_input).and_return('X')

      expect(info.ask_for_marker).to eq("X")
    end

    it 'ask for player marker' do
      allow(input).to receive(:get_user_input).and_return('Y')

      expect(info.ask_for_marker).to eq("Y")
    end

    it 'stores the player names' do
      allow(input).to receive(:get_user_input).and_return('Anda')
      info.ask_for_name

      expect(info.player_names).to include("Anda")
    end

    it 'stores the player names' do
      allow(input).to receive(:get_user_input).and_return('Anda', 'Doug')

      expect(info.player_names).to include('Anda', 'Doug')
    end

    it 'stores the markers' do
      allow(input).to receive(:get_user_input).and_return('X', 'Y')

      expect(info.markers).to include('X', 'Y')
    end

    it 'does not store duplicate markers' do
      allow(input).to receive(:get_user_input).and_return('X', 'X', 'Y')

      expect(info.markers).to include('X', 'Y')
    end

    it 'organizes the player info by player' do
      allow(input).to receive(:get_user_input).and_return('Anda', 'Alex', 'X', 'Y')

      expect(info.player_info).to eq([['Anda', 'X'], ['Alex', 'Y']])
    end

    it 'organizes the player info by player' do
      allow(input).to receive(:get_user_input).and_return('Doug', 'Alex', 'X','X','X','X','X', 'Y')

      expect(info.player_info).to eq([['Doug', 'X'], ['Alex', 'Y']])
    end
  end
end