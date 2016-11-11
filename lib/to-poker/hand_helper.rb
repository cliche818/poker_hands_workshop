module ToPoker
  module HandHelper
    def frequency(hand)
      counter = {}

      hand.cards.each do |card|
        if counter[card.rank]
          counter[card.rank] += 1
        else
          counter[card.rank] = 1
        end
      end

      counter
    end
  end
end
