module ToPoker
  class FullHouse
    def self.run(hand)
      counter = {}

      hand.cards.each do |card|
        if counter[card.rank]
          counter[card.rank] += 1
        else
          counter[card.rank] = 1
        end
      end

      if counter.values == [3,2] || counter.values == [2,3]
        return true
      else
        return false
      end
    end
  end
end
