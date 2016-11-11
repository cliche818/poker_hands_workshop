# frozen_string_literal: true

module ToPoker
  # The Deck represents a set of cards from standard deck
  class Deck
    include Enumerable

    # A DeckEmptyError is raised when there are an insufficient number of cards
    # to deal when requested to do so.
    DeckEmptyError = Class.new(StandardError)

    # Create a new deck with a standard set of 52 cards
    #
    # The cards will be shuffled such that they are randomized.
    #
    # @example
    #   ToPoker::Deck.new
    #
    # @api public
    def initialize
      @cards = Card::VALID_RANKS.flat_map do |rank|
        Suit::VALID_SUITS.each.flat_map do |suit|
          Card.new(rank, Suit.new(suit))
        end
      end.shuffle
    end

    # Iterate through each card in the deck
    #
    # This is required by inclusion of Enumerable
    #
    # @api public
    # @yield Iterates through using each
    # @return [Enumerable]
    def each(&block)
      @cards.each(&block)
    end

    # Deal out a poker hand containing the specified number of cards
    #
    # @example
    #   deck.deal(5) #=> Returns a hand with 5 cards
    #
    # @api public
    # @param number [Fixnum] The number of cards to deal
    # @return [ToPoker::Hand] A poker hand containing `number` cards
    def deal(number)
      fail DeckEmptyError if count < number
      Hand.new(@cards.shift(number))
    end
  end
end
