# frozen_string_literal: true

# Card represents a single playing card
#
# A card will have a rank, and a suit. For example, the King of Hearts will
# have a rank of King and a suit representing Hearts.
class ToPoker::Card
  attr_reader :rank, :suit

  # The valid ranks listing their Ruby symbol alon with a string representation
  RANK_STRINGS = {
    two: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: 'T',
    jack: 'J',
    queen: 'Q',
    king: 'K',
    ace: 'A'
  }.freeze

  # An array listing the valid ranks including only the symbols accepted
  VALID_RANKS = RANK_STRINGS.keys.freeze

  # An error thrown when an invalid rank is passed in when creating this card.
  # You should ensure that the rank is listed in `VALID_RANKS`
  UnknownRankError = Class.new(StandardError)

  # Create a new card
  #
  # @example
  #   ToPoker::Card.new(:two, ToPoker::Suit.new(:clubs))
  #
  # @api public
  # @param rank [Symbol] The rank for the card, must by a member of VALID_RANKS
  # @param suit [ToPoker::Suit] The suit of this card
  def initialize(rank, suit)
    fail UnknownRankError unless VALID_RANKS.include?(rank)
    @rank = rank
    @suit = suit
  end

  # Convert the card to a string
  #
  # @example
  #   card.to_s #=> "9C"
  #
  # @api public
  # @return [String] The card in string form containing a character to represent
  #   both the rank and suit.
  def to_s
    RANK_STRINGS[rank].to_s + suit.symbol
  end

  # Compare if the two cards have the same rank
  #
  # The 2 of diamonds will be considered to be equal to the two of clubs but
  # not equal to the 3 of diamonds.
  #
  # @api public
  # @param other [ToPoker::Card] The card to compare to
  # @return [Boolean] True if the ranks are equal, false otherwise.
  def ==(other)
    rank == other.rank
  end
end
