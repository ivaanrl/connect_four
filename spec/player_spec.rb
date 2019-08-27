require './lib/player'
describe Player do
  before(:each) do
    @player1 = Player.new("\u2612")
    @player2 = Player.new("\u2688")
  end

  describe "#new" do
    it "should give every player a different color" do
      expect(@player1.piece).to eql("\u2612")
      expect(@player2.piece).to eql("\u2688")
    end
  end
end