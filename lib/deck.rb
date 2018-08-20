# Create a class for the card Deck
require 'pry'

require './lib/card'


class Deck
  attr_reader :cards

  # Cards is an array of Card instances
  def initialize(cards)
    @cards = cards
  end

  # Cards is an array of Card instances
  def add_card(card)
    @cards << card
  end

  def count
    @cards.count
  end

end
