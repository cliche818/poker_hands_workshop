module ToPoker
  class OnePair < Hand
    extend HandHelper

    def self.run(hand)
      counter = frequency(hand)

      counter.values.max == 2 ? true : false
    end
  end
end
