module ToPoker
  RSpec.describe ThreeOfAKind do
    it 'should evaluate a three of a kind' do
      result = ThreeOfAKind.run(Hand.new([Card.new(:four, Suit.new(:hearts)),
                                          Card.new(:four, Suit.new(:clubs)),
                                          Card.new(:four, Suit.new(:hearts)),
                                          Card.new(:five, Suit.new(:clubs)),
                                          Card.new(:six, Suit.new(:spades))
                                         ]))
      expect(result).to eq(true)

    end

    it 'should evaluate a three of a kind' do
      result = ThreeOfAKind.run(Hand.new([Card.new(:four, Suit.new(:hearts)),
                                          Card.new(:four, Suit.new(:clubs)),
                                          Card.new(:five, Suit.new(:hearts)),
                                          Card.new(:five, Suit.new(:clubs)),
                                          Card.new(:six, Suit.new(:spades))
                                         ]))
      expect(result).to eq(false)

    end
  end
end
