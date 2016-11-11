module ToPoker
  class Comparator
    def self.run(first_hand, second_hand)
      first_hand_type_score = calculate_type_score(first_hand)
      second_hand_type_score = calculate_type_score(second_hand)

      if first_hand_type_score > second_hand_type_score
        1
      else
        2
      end
    end

    class << self
      def calculate_type_score(hand)
        type = :high_card

        if FullHouse.is?(hand)
          type = :full_house
        elsif ThreeOfAKind.is?(hand)
          type = :three_of_a_kind
        elsif OnePair.is?(hand)
          type = :pair
        end

        Hand::TYPE_ORDER.index(type)
      end
    end
  end
end
