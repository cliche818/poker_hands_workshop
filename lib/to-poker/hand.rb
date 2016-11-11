# frozen_string_literal: true

module ToPoker
  # A Hand represents a set of cards together
  #
  # A standard poker hand contains 5 cards.
  class Hand
    attr_reader :cards

    # A list of the different types of hands ranked in order from worst
    # to best
    TYPE_ORDER = [
      :high_card,
      :pair,
      :two_pair,
      :three_of_a_kind,
      :straight,
      :flush,
      :full_house,
      :four_of_a_kind,
      :straight_flush
    ]

    # Create a new hand from an array of cards
    #
    # @example
    #   ToPoker::Hand.new(cards)
    #
    # @api public
    # @param cards [Array<ToPoker::Card>]
    def initialize(cards)
      @cards = cards
    end

    # Return a representation fo this hand as a string
    #
    # @example
    #   hand.to_s #=> "AD KD QD JD TD"
    #
    # @api public
    # @return [String]
    def to_s
      cards.map(&:to_s).join(' ')
    end
  end
end
