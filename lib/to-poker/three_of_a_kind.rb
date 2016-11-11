module ToPoker
  class ThreeOfAKind
    def self.run(hand)
      counter = {}

      hand.cards.each do |card|
        rank = card.rank
        if counter[rank]
          counter[rank] +=  1
        else
          counter[rank] = 1
        end
      end

      counter.each_key do |rank|
        return true if counter[rank] == 3
      end

      return false
    end
  end
end
