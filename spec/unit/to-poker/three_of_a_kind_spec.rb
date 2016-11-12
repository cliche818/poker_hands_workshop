module ToPoker
  RSpec.describe ThreeOfAKind do
    describe '.is?' do
      it 'should evaluate a three of a kind' do
        result = ThreeOfAKind.is?(Hand.new([Card.new(:four, Suit.new(:hearts)),
                                            Card.new(:four, Suit.new(:clubs)),
                                            Card.new(:four, Suit.new(:hearts)),
                                            Card.new(:five, Suit.new(:clubs)),
                                            Card.new(:six, Suit.new(:spades))
                                           ]))
        expect(result).to eq(true)

      end

      it 'should evaluate a three of a kind' do
        result = ThreeOfAKind.is?(Hand.new([Card.new(:four, Suit.new(:hearts)),
                                            Card.new(:four, Suit.new(:clubs)),
                                            Card.new(:five, Suit.new(:hearts)),
                                            Card.new(:five, Suit.new(:clubs)),
                                            Card.new(:six, Suit.new(:spades))
                                           ]))
        expect(result).to eq(false)
      end
    end

    describe 'same_type_score' do
      it 'should return 4 if the three of a kind is 4' do
        result = ThreeOfAKind.same_type_score(Hand.new([Card.new(:four, Suit.new(:hearts)),
                                                        Card.new(:four, Suit.new(:clubs)),
                                                        Card.new(:four, Suit.new(:hearts)),
                                                        Card.new(:five, Suit.new(:clubs)),
                                                        Card.new(:six, Suit.new(:spades))
                                                       ]))
        expect(result).to eq(4)
      end
    end
  end
end
