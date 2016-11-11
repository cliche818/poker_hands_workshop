module ToPoker
  class ThreeOfAKind
    extend HandHelper

    def self.run(hand)
      counter = frequency(hand)

      counter.values.max == 3 ? true : false
    end
  end
end
