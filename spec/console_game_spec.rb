require 'rspec'
require 'spec_helper'
require_relative '../lib/console_game'

describe ConsoleGame do

  let(:ttt_game) { double('ttt_game') }
  let(:view) { double('view', :board_to_s => nil, :welcome => nil, :winner_message => nil, :tied_message => nil, :spot_selection => nil, :dotted_line => nil) }
  let(:output) { double('output', :print => nil) }
  let(:input) { double('input') }
  let(:g) { ConsoleGame.new(:ttt_game => ttt_game, :view => view, :output => output, :input => input) }



  describe "#play_game" do
    context 'prompts each player to move until the game is over' do
      it 'prompts each player to move until the game is won by a player' do
        allow(ttt_game).to receive(:selected_spot).and_return(3)
        allow(ttt_game).to receive(:current_state).and_return(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
        allow(ttt_game).to receive(:game_over?).and_return([false, false])
        allow(ttt_game).to receive(:game_winner).and_return("Anda")

        g.play_game

        expect(g.playing_surface).to eq(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
       end
     end

       it 'prompts each player to move until the game ends in a tie' do
        allow(ttt_game).to receive(:selected_spot).and_return(3)
        allow(ttt_game).to receive(:current_state).and_return(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
        allow(ttt_game).to receive(:game_over?).and_return([false, false])
        allow(ttt_game).to receive(:game_winner).and_return(nil)

        g.play_game

        expect(g.playing_surface).to eq(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
       end

      it 'prompts each player to move until the game is won by a player' do
        allow(ttt_game).to receive(:selected_spot).and_return([3, 4, 5])
        allow(ttt_game).to receive(:current_state).and_return(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
        allow(ttt_game).to receive(:game_over?).and_return(false, false, false, true)
        allow(ttt_game).to receive(:make_move)
        allow(ttt_game).to receive(:previous_player).and_return({:name => "Anda"})
        allow(ttt_game).to receive(:game_winner).and_return("Anda")

        g.play_game

        expect(g.playing_surface).to eq(["X", "X", "X", "Y", "Y", "5", "6", "7", "8"])
   end
 end
end
