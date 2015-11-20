require 'rspec'
require 'spec_helper'
require_relative '../lib/player_info'


describe PlayerInfo do

  let(:input) { double('input') }
  let(:output) { double('output', :print => nil) }
  let(:view) { double('view', :ask_for_name => nil, :ask_for_marker => nil) }
  let(:setup) { double('setup') }
  let(:info) { PlayerInfo.new(input, output, view, setup) }

  describe "#ask_for_name" do
      it 'asks for player name' do
        allow(input).to receive(:get_user_input).and_return('Anda')

        expect(info.ask_for_name).to eq("Anda")
      end

      it 'asks for player name' do
        allow(input).to receive(:get_user_input).and_return('Alex')

        expect(info.ask_for_name).to eq("Alex")
      end
    end

  describe "#ask_for_marker" do
    it 'asks for player marker' do
      allow(input).to receive(:get_user_input).and_return('X')

      expect(info.ask_for_marker("Anda")).to eq("X")
    end

    it 'ask for player marker' do
      allow(input).to receive(:get_user_input).and_return('Y')

      expect(info.ask_for_marker("Anda")).to eq("Y")
    end
  end
end