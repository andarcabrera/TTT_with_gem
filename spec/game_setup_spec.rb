require 'rspec'
require 'spec_helper'
require_relative '../lib/game_setup'

describe GameSetup do

  let(:input) { double('input') }
  let(:output) { double('output', :print => nil) }
  let(:view) { double('view', :select_game_type => nil) }
  let(:setup) { GameSetup.new(input, output, view) }

  describe "#select_game_type" do
    it 'asks for game type selection' do
      allow(input).to receive(:get_user_input).and_return('1')

      expect(setup.select_game_type).to eq('1')
    end

    it 'asks for game type selection' do
      allow(input).to receive(:get_user_input).and_return('2')

      expect(setup.select_game_type).to eq('2')
    end
  end

end