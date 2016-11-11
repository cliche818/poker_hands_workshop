# frozen_string_literal: true

RSpec.describe ToPoker::Suit do
  let(:suit) { described_class.new(type) }
  let(:type) { :clubs }

  describe '#initialize' do
    subject { suit }

    context 'when the type is valid' do
      it 'does not raise an error' do
        expect { subject }.to_not raise_error
      end
    end

    context 'when the type is not valid' do
      let(:type) { :flowers }
      it 'raises an unknown suit error' do
        expect { subject }.to raise_error(ToPoker::Suit::UnknownSuitError)
      end
    end
  end

  describe '#name' do
    subject { suit.name }

    context 'when the suit is clubs' do
      let(:type) { :clubs }
      it { is_expected.to eq('Clubs') }
    end

    context 'when the suit is diamonds' do
      let(:type) { :diamonds }
      it { is_expected.to eq('Diamonds') }
    end

    context 'when the suit is hearts' do
      let(:type) { :hearts }
      it { is_expected.to eq('Hearts') }
    end

    context 'when the suit is spades' do
      let(:type) { :spades }
      it { is_expected.to eq('Spades') }
    end
  end

  describe '#symbol' do
    subject { suit.symbol }

    context 'when the suit is clubs' do
      let(:type) { :clubs }
      it { is_expected.to eq('C') }
    end

    context 'when the suit is diamonds' do
      let(:type) { :diamonds }
      it { is_expected.to eq('D') }
    end

    context 'when the suit is hearts' do
      let(:type) { :hearts }
      it { is_expected.to eq('H') }
    end

    context 'when the suit is spades' do
      let(:type) { :spades }
      it { is_expected.to eq('S') }
    end
  end
end
