# frozen_string_literal: true

RSpec.describe ToPoker::Card do
  let(:card) { described_class.new(rank, suit) }
  let(:rank) { :two }
  let(:suit) { clubs }
  let(:clubs) { ToPoker::Suit.new(:clubs) }
  let(:diamonds) { ToPoker::Suit.new(:diamonds) }

  describe '#initialize' do
    subject { card }

    context 'when the rank is valid' do
      it 'does not raise an error' do
        expect { subject }.to_not raise_error
      end
    end

    context 'when the rank is not valid' do
      let(:rank) { 'pi' }

      it 'raises an UnknownRankError' do
        expect { subject }.to raise_error(ToPoker::Card::UnknownRankError)
      end
    end
  end

  describe '#rank' do
    subject { card.rank }

    it { is_expected.to be(:two) }
  end

  describe '#suit' do
    subject { card.suit }

    it { is_expected.to be(clubs) }
  end

  describe '#to_s' do
    subject { card.to_s }

    it { is_expected.to eq('2C') }
  end

  describe '#==' do
    subject { card == other_card }

    context 'when two cards are the same rank' do
      let(:other_card) { described_class.new(rank, diamonds) }
      it { should be true }
    end

    context 'when two cards are not the same rank' do
      let(:other_card) { described_class.new(:four, suit) }
      it { should be false }
    end
  end
end
