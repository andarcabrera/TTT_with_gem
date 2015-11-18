require 'rspec'
require_relative '../lib/player'

describe Player do
  describe '#pick_spot' do
    it 'picks a spot to place its marker' do
      input = double 'input'
      player = Player.new(input)
      allow(input).to receive(:get_user_input).and_return('1')

      expect(player.pick_spot).to eq('1')
    end
  end

end