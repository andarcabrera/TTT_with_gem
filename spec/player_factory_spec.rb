require 'rspec'
require 'spec_helper'
require_relative '../lib/player_factory'

describe PlayerFactory do

  let(:info) { double('info') }
  let(:input) { double('input') }
  let(:output) { double('output') }
  let(:view) { double('view') }

  describe '#players' do
    it 'creates a player for each player_info information set' do
      factory = PlayerFactory.new(info, input, output, view)
      allow(info).to receive("player_info").and_return(['Anda', 'X'], ['Alex', 'Y'])

      expect(factory.players.count).to eq(2)
    end

    context 'receives data sets for 2 human players' do
      it 'creates 2 human layers' do
        factory = PlayerFactory.new(info, input, output, view)
        allow(info).to receive("player_info").and_return(['Eli', 'X'], ['Andrew', 'Y'])

        expect(factory.players[0].class).to be(HumanPlayer)
      end
    end
  end
end