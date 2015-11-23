require 'rspec'
require 'spec_helper'
require_relative '../lib/input'

describe Input do
  let(:input) { Input.new }

  describe "#get_user_input" do
    it 'requesta user input' do
      allow(STDIN).to receive(:gets).and_return("X")

      expect(input.get_user_input).to eq("X")
    end
  end
end