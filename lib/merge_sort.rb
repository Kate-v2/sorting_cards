# Create a class for Merge sort functionality
require 'pry'

require './lib/card'
require './lib/deck'
require './lib/sort'

class MergeSort

  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @value_order = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
  end

  # ###########################################################

  def rank_all_cards
    ranked_cards_hash = {}
    @deck.cards.each do |card|
      rank = rank_card(card)
      ranked_cards_hash[rank] = card
    end
    return ranked_cards_hash
  end

  def rank_card(card)
    val = @value_order.index(card.value)
    suit = @suit_order.index(card.suit)
    rank = [val, suit].join.to_i
    return rank
  end

  def order_cards(keys, hash)
    sorted = []
    keys.each do |key|
      sorted << hash[key]
    end
    return sorted
  end

  # ###########################################################

  def sort
    keys = rank_all_cards.keys
    sorted_keys = sorting(keys)
    sorted_cards = order_cards(sorted_keys, rank_all_cards)
    return sorted_cards
  end

  def sorting(array)
    if array.size < 2
      return array
    else
      left = split_left(array)
      sorting(left)
      right = split_right(array)
      sorting(right)
      sorted = merge(left, right)
    end
    return sorted
  end

  def split_left(array)
    size = array.size
    half = size/2
    split = array.slice(0, half)
    return split
  end

  def split_right(array)
    size = array.size
    half = size/2
    split = array.slice(half, half+1)
    return split
  end

  def merge(left, right)
    arr = []
    size = left.size + right.size
    index = 0
    while index < size
      if right.size == 2 && left.size == 0
        arr << right.min
        arr << right.max
        index += 2
      elsif left[0] == nil
        arr << right.shift
        index += 1
      elsif right[0] == nil
        arr << left.shift
        index += 1
      elsif left[0] < right[0]
        arr << left.shift
        index +=1
      else
        arr << right.shift
        index += 1
      end
    end
    return arr
  end

end
