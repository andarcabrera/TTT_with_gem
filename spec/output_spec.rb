require 'rspec'
require 'spec_helper'
require_relative '../lib/output'

describe Output do
  let(:output) { Output.new }
  it 'prints to console' do
    message = "Test"
    allow(STDOUT).to receive(:puts).and_return("Test")

    expect(output.print(message)).to eq("Test")
  end
end
