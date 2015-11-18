require 'rspec'
require 'spec_helper'
require_relative '../lib/player'

describe Player do
  describe '#pick_spot' do
    it 'picks a spot to place its marker' do
      input = double 'input'
      output = double 'output'
      view = double 'view'
      player = Player.new('X', input, output, view)
      allow(view).to receive(:move_prompt)
      allow(output).to receive(:print)
      allow(input).to receive(:get_user_input).and_return('1')

      expect(player.pick_spot).to eq('1')
    end
  end

end