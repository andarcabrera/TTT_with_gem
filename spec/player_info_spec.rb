require 'rspec'
require 'spec_helper'
require_relative '../lib/player_info'


describe PlayerInfo do

  describe "#ask_for_name" do
    it 'asks for player name' do
      info = PlayerInfo.new

      expect(info.ask_for_name).to eq("Anda")
    end
  end
end