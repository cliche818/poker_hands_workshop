module ToPoker
  class FullHouse < Hand
    extend HandHelper

    def self.run(hand)
      counter = frequency(hand)

      if counter.values == [3,2] || counter.values == [2,3]
        return true
      else
        return false
      end
    end
  end
end
