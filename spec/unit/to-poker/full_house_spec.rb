module ToPoker
  RSpec.describe FullHouse do
    it 'should evaluate a full house' do
      result = FullHouse.is?(Hand.new([
        Card.new(:five, :hearts),
        Card.new(:five, :diamonds),
        Card.new(:five, :spades),
        Card.new(:three, :hearts),
        Card.new(:three, :diamonds)
      ]))
      expect(result).to eq(true)
    end

    it 'should not evaluate a full house' do
      result = FullHouse.is?(Hand.new([
        Card.new(:two, :hearts),
        Card.new(:five, :diamonds),
        Card.new(:five, :spades),
        Card.new(:three, :hearts),
        Card.new(:three, :diamonds)
      ]))
      expect(result).to eq(false)
    end
  end
end
