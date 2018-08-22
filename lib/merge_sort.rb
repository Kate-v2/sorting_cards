# Create a class for Merge sort functionality

require './lib/card'
require './lib/deck'
require './lib/sort'

# ###########################################################
# We’re doing the same here, but with a different sorting algorithm, merge sort. As you implement this, think about why do we need different algorithms? How many swaps does your sort from iteration 3 make in the best case scenario? Worst case? How does this compare to Merge Sort?
#
# The interaction pattern will look like this:
#
# card_1 = Card.new("4","Hearts")
# card_2 = Card.new("Jack", "Clubs")
# card_3 = Card.new("5", "Diamonds")
# card_4 = Card.new("Ace", "Spades")
# card_5 = Card.new("Ace", "Diamonds")
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
#
# deck.merge_sort
# => [card_1, card_3, card_2, card_5, card_4]
# ###########################################################
#
# Wikipedia: https://en.wikipedia.org/wiki/Merge_sort
# Conceptually, a merge sort works as follows:
#
# Divide the unsorted list into n sublists, each containing 1 element (a list of 1 element is considered sorted).
# Repeatedly merge sublists to produce new sorted sublists until there is only 1 sublist remaining. This will be the sorted list.

# ###########################################################


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
    # binding.pry
    return sorted_cards
  end

  def sorting(array)
    if array.size < 2
      return array
    else
      # split left
      left = split_left(array)
      sorting(left)
      # split right
      right = split_right(array)
      sorting(right)
      # merge
      sorted = merge(left, right)
    end
    # binding.pry
    return sorted
  end

  def split_left(array)
    size = array.size
    half = size/2
    split = array.slice(0, half)
    # binding.pry
    return split
  end

  def split_right(array)
    size = array.size
    half = size/2
    split = array.slice(half, half+1)
    # binding.pry
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
      # binding.pry
    end
    return arr
  end

end
