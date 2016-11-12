module ToPoker
  RSpec.describe Comparator do
    describe '.run' do
      it 'should return 1 if the 1st hand (three of a kind) is bigger than 2nd hand (high card)' do
        first_hand = Hand.new([
                                Card.new(:five, :hearts),
                                Card.new(:five, :clubs),
                                Card.new(:five, :spades),
                                Card.new(:three, :hearts),
                                Card.new(:two, :clubs)
                              ])

        second_hand = Hand.new([
                                 Card.new(:ten, :clubs),
                                 Card.new(:five, :clubs),
                                 Card.new(:four, :spades),
                                 Card.new(:three, :clubs),
                                 Card.new(:two, :clubs)
                               ])
        expect(Comparator.run(first_hand, second_hand)).to eq(1)
      end

      it 'should return 2 if the 2nd hand (three of a kind) is bigger than 1st hand (one pair)' do
        first_hand = Hand.new([
                                Card.new(:five, :clubs),
                                Card.new(:five, :spades),
                                Card.new(:four, :spades),
                                Card.new(:three, :clubs),
                                Card.new(:two, :clubs)
                              ])

        second_hand = Hand.new([
                                 Card.new(:five, :hearts),
                                 Card.new(:five, :clubs),
                                 Card.new(:five, :spades),
                                 Card.new(:three, :hearts),
                                 Card.new(:two, :clubs)
                               ])

        expect(Comparator.run(first_hand, second_hand)).to eq(2)
      end

      it 'should return 1 if the first hand (three of a kind) is bigger than the 2nd hand (three of a kind' do
        first_hand = Hand.new([
                                Card.new(:seven, :clubs),
                                Card.new(:seven, :spades),
                                Card.new(:seven, :hearts),
                                Card.new(:three, :clubs),
                                Card.new(:two, :clubs)
                              ])

        second_hand = Hand.new([
                                 Card.new(:five, :hearts),
                                 Card.new(:five, :clubs),
                                 Card.new(:five, :spades),
                                 Card.new(:three, :hearts),
                                 Card.new(:two, :clubs)
                               ])

        expect(Comparator.run(first_hand, second_hand)).to eq(1)
      end
    end
  end
end
