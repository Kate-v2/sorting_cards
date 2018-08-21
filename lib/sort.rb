# Create a class for Sort functionality

# ------------------------------------------------------------------------------
# Add to the deck object
  # sort the cards based on their value
    # LOW TO HIGH
      # val_order = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
      # val_order_st = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]

# two cards have the same value,
  # lowest to highest
    # Clubs, Diamonds, Hearts, Spades.

# ------------------------------------------------------------------------------

require 'pry'
require './lib/deck'
require './lib/card'


class Sort
  attr_reader :deck, :value_order, :suit_order

  def initialize(deck)
    @deck = deck
    @value_order = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
  end

  # ########################################

  def sort_deck
    ranked = rank_all_cards
    sorted_keys = sort_keys(ranked)
    sorted_cards = order_cards(sorted_keys, ranked)
    return sorted_cards
  end

  # ########################################

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

  # def sort_by_key_rank(ranked)
  def sort_keys(ranked)
    sorted_keys = []
    keys = ranked.keys
    while keys.count > 0
      sorted_keys << keys.min
      keys.delete(keys.min)
    end
    return sorted_keys
  end

  def order_cards(keys, hash)
    sorted = []
    keys.each do |key|
      sorted << hash[key]
    end
    return sorted
  end
end
