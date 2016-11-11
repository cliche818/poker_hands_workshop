module ToPoker
  class OnePair
    def self.run(hand)

      counter = {}

      hand.cards.each do |card|
        if counter[card.rank]
          counter[card.rank] += 1
        else
          counter[card.rank] = 1
        end

        if counter[card.rank] = 2
          return true
        end
      end

      return false
    end
  end
end
