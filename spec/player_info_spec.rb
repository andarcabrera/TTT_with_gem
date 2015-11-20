require 'rspec'
require 'spec_helper'
require_relative '../lib/player_info'


describe PlayerInfo do

  let(:input) { double('input') }
  let(:output) { double('output', :print => nil) }
  let(:view) { double('view', :ask_for_name => nil, :ask_for_marker => nil) }
  let(:setup) { double('setup') }
  let(:info) { PlayerInfo.new(input, output, view, setup) }

  describe 'player_info' do
    context 'game type is human vs.human' do
      it 'stores the information for 2 human player if option one selected in setup' do
        allow(input).to receive("get_user_input").and_return('Anda', 'X', 'Alex', 'Y')
        allow(setup).to receive(:select_game_type).and_return('1')


        expect(info.player_info).to eq([['Anda', 'X'], ['Alex', 'Y']])
      end

       it 'stores the information for 2 human player if option one selected in setup' do
        allow(input).to receive(:get_user_input).and_return('Doug', 'X', 'Mike', 'Y')
        allow(setup).to receive(:select_game_type).and_return('1')

        expect(info.player_info).to eq([['Doug', 'X'], ['Mike', 'Y']])
      end

      it 'stores the information without having duplicate' do
        allow(input).to receive(:get_user_input).and_return('Doug', 'X', 'Mike', 'X', 'Y')
        allow(setup).to receive(:select_game_type).and_return('1')

        expect(info.player_info).to eq([['Doug', 'X'], ['Mike', 'Y']])
      end
    end

    context 'game type is computer vs.computer' do
      it 'stores the information for 2 computer players if option 3 selected in setup' do
        allow(input).to receive("get_user_input").and_return('X', 'Y', 'Anda', 'Bla')
        allow(setup).to receive(:select_game_type).and_return('3')

        expect(info.player_info).to eq([['computer', 'X'], ['computer', 'Y']])
      end
    end

    context 'game type is human vs.computer' do
      it 'stores the information for 1 computer player and 1 human player if option 2 is selected in setup' do
        allow(input).to receive("get_user_input").and_return('Anda', 'X', 'Y', 'Bla')
        allow(setup).to receive(:select_game_type).and_return('2')

        expect(info.player_info).to eq([['Anda', 'X'], ['computer', 'Y']])
      end
    end
  end
end