# frozen_string_literal: true

module ToPoker
  # A suit represents the category of a particular card
  #
  # In a standard deck of playing cards there are four suits: clubs, diamonds,
  # hearts, and spades.
  class Suit
    # A hash containing the list of valid suits organized by Symbol and Enlgish
    # name
    SUIT_NAME = {
      clubs: 'Clubs',
      diamonds: 'Diamonds',
      hearts: 'Hearts',
      spades: 'Spades'
    }.freeze

    # A hash containing the list of valid suits organized by Symbol and short
    # character (C, D, H, S).
    SUIT_SYMBOL = {
      clubs: 'C',
      diamonds: 'D',
      hearts: 'H',
      spades: 'S'
    }.freeze

    # A list of the valid symbols that can be be created for a suit.
    VALID_SUITS = SUIT_NAME.keys.freeze

    # An error will be thrown if a suit is attempting to be created that
    # is not in the list of valid suits.
    UnknownSuitError = Class.new(StandardError)

    # Create the suite of an acceptable type
    #
    # @example
    #   ToPoker::Suit.new(:clubs)
    #
    # @api public
    # @param type [Symbol] A valid suit type (e.g. :clubs, :diamonds,
    #   :hearts, or :spades)
    def initialize(type)
      fail UnknownSuitError unless VALID_SUITS.include?(type)
      @type = type
    end

    # The English name of the suit
    #
    # @example
    #   suit.name #=> "Clubs"
    #
    # @api public
    # @return [String] The name of the suit
    def name
      SUIT_NAME.fetch(@type)
    end

    # The cimple character symbol for the suit
    #
    # @example
    #   suit.symbol #=> "C"
    #
    # @api public
    # @return [String] The symbol for the suit
    def symbol
      SUIT_SYMBOL.fetch(@type)
    end
  end
end
