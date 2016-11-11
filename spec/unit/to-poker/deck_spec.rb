# frozen_string_literal: true

RSpec.describe ToPoker::Deck do
  let(:deck) { described_class.new }

  describe '#initialize' do
    it 'contains 52 cards' do
      expect(subject.count).to be(52)
    end
  end

  describe '#deal' do
    subject { deck.deal(number) }

    context 'when passing in 5' do
      let(:number) { 5 }

      it 'returns a hand with 5 random cards' do
        expect(subject.cards.count).to be 5
      end

      it 'removes those 5 cards from the deck' do
        expect(subject.cards.all? do |card|
          deck.map(&:object_id).include?(card.object_id)
        end).to be false
        expect(deck.count).to be 47
      end
    end

    context 'when passing in 13' do
      let(:number) { 13 }

      it 'returns 13 cards' do
        expect(subject.cards.count).to be 13
      end
    end

    context 'when the deck is exhaused' do
      let(:number) { 1 }

      before { deck.deal(52) }

      it 'raises an error' do
        expect { subject }.to raise_error(ToPoker::Deck::DeckEmptyError)
      end
    end
  end
end
