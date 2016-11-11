# frozen_string_literal: true

RSpec.describe ToPoker::Hand do
  def build(card_shorthand)
    card_shorthand.split(' ').map do |short|
      ToPoker::Card.new(
        ToPoker::Card::RANK_STRINGS.key(short[0]),
        suits.fetch(short[1])
      )
    end
  end

  let(:hand) { described_class.new(card_array) }
  let(:card_array) { build(cards) }

  let(:clubs) { ToPoker::Suit.new(:clubs) }
  let(:diamonds) { ToPoker::Suit.new(:diamonds) }
  let(:hearts) { ToPoker::Suit.new(:hearts) }
  let(:spades) { ToPoker::Suit.new(:spades) }
  let(:suits) do
    {
      'C' => clubs,
      'D' => diamonds,
      'H' => hearts,
      'S' => spades
    }
  end

  describe '#cards' do
    subject { hand.cards }
    let(:cards) { '3H 4H 5H 6H 7H' }

    it 'assigns returns the values passed in the constructor' do
      expect(subject).to eq card_array
    end
  end
end
