require './lib/board'

describe Board do
  before(:each) do
    @board = Board.new
    @blank = "\u2610"
  end
  describe "#new" do
    it "should return an instance of the class Board" do
      expect(@board).to be_an_instance_of(Board)
    end
  end

  describe "grid" do
    it 'should be a 6 by 7 Array' do
      expect(@board.grid.size).to eql(6)
      expect(@board.grid[0].size).to eql(7)
      expect(@board.grid).to be_an_instance_of(Array)
    end

    it "should contain a blank space in every container" do
      i=0
      while i < 5
        j=0
        while j < 6
        expect(@board.grid[0][0]).to eql(@blank)
        j += 1
        end
        i += 1
      end
    end
  end
end