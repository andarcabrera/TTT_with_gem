require_relative '../lib/user_interface'

describe UserInterface do

  let(:input) { double 'input' }
  let(:output) { double 'output', :print => nil }
  let(:view) { double 'view', :move_prompt => nil, :invalid_entry_spot => nil }
  let(:ui) { UserInterface.new(input, output, view) }

  describe "#get_spot" do
    it "returns a spot selected by the user" do
      allow(input).to receive(:get_user_input).and_return(5)

      expect(ui.get_spot).to eq(5)
    end
  end

  describe "#error" do
    it "returns an error for the user" do
      expect(ui.error).to be nil
    end
  end

  describe "#no_more_moves_allowed?" do
    it "returns false" do
      expect(ui.no_more_moves_allowed?).to be false
    end
  end
end
