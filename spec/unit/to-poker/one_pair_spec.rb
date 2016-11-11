module ToPoker
  RSpec.describe OnePair do
    it "should evaluate true if the hand is one pair" do
      result = OnePair.run(Hand.new([
        Card.new(:five, :hearts),
        Card.new(:five, :clubs),
        Card.new(:four, :spades),
        Card.new(:three, :hearts),
        Card.new(:two, :clubs)
        ]))
      expect(result).to eq(true)
    end

    it "should evaluate false if the hand does not have one pair" do
      result = OnePair.run(Hand.new([
        Card.new(:ten, :clubs),
        Card.new(:five, :clubs),
        Card.new(:four, :spades),
        Card.new(:three, :clubs),
        Card.new(:two, :clubs)
        ]))
      expect(result).to eq(false)
    end
  end
end
