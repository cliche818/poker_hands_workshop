module ToPoker
  class ThreeOfAKind
    extend HandHelper

    def self.is?(hand)
      counter = frequency(hand)

      counter.values.max == 3 ? true : false
    end

    def self.same_type_score(hand)
      counter = frequency(hand)

      same_type_score = nil

      counter.each do |rank, frequency|
        same_type_score = Card::RANK_STRINGS[rank] if frequency == 3
      end

      same_type_score.to_i
    end
  end
end
