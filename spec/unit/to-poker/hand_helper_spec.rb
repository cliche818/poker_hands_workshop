module ToPoker
  RSpec.describe HandHelper do

    let(:dummy_class) { Class.new { extend HandHelper } }

    describe '#frequency' do
      it 'should return a hash with the rank as key and frequency as value for a hand' do
        hand = Hand.new([
                          Card.new(:five, :hearts),
                          Card.new(:five, :clubs),
                          Card.new(:five, :spades),
                          Card.new(:three, :hearts),
                          Card.new(:two, :clubs)
                        ])
        freq = dummy_class.frequency(hand)
        expect(freq).to eq({five: 3, three: 1, two: 1})
      end
    end
  end
end
