# Create a class for the card Deck
require 'pry'

require './lib/card'
require './lib/sort'
require './lib/merge_sort'


class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def count
    @cards.count
  end

  def sort
    sorted_array = Sort.new(self).sort_deck
    return sorted_array
  end

  def merge_sort
    sorted = MergeSort.new(self).sort
    return sorted
  end
end
