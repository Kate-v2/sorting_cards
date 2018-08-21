# Create a class for sorting functionality

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

class Sort
  attr_reader :deck, :value_order, :suit_order

  def initialize(deck)
    @deck = deck
    @value_order = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    @suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
  end

  def create_ranked_array
    unsorted_ranked = []
    @deck.each do |card|
      unsorted_ranked << card_rank(card)
    end
    binding.pry
    return unsorted_ranked
  end

  def card_rank(card)
    # val = index_val(card.value)
    # suit = index_suit(card.suit)
    val = index_int(card.value, @value_order)
    suit = index_int(card.suit, @suit_order)
    string = [val, suit].join
    rank = string.to_i
    return rank
  end

  def index_int(string, array)
    i = array.index(string)
    return i
  end


  # def index_val(string)
  #   index = @value_order.index(string)
  #   return index
  # end
  #
  # def index_suit(string)
  #   index = @suit_order.index(string)
  #   return index
  # end

  def sort_ranks
    unsorted = create_ranked_array
    sorted = []
    while unsorted.count > 0
      sorted << unsorted.min
      unsorted.delete(unsorted.min)
    end
    return sorted
  end

  def sort
    ranks = sort_ranks
    sorted_array = []
    ranks.each do |rank|
      sorted_array << pair_card_attributes(rank)
    end
    return sorted_array
  end

  def pair_card_attributes(rank)
    val = @value_order[rank / 10]
    suit = @suit_order[rank % 10]
    return pair = [val, suit]
  end

end






# Each Card
  # grab a card
  # evalutate the card
  # create a combo array unsorted
  # finsih evalutating all cards
  # sort the array

# evalutate a card & add to temp array
  # vals 0-12  (already ordered, use index)
  # suits 0 - 4 (already ordered, use index)
  # combine val + suit as string via join
  # convert string to int -->> 2(4) 3(4) 4(4) 5(4) 6(4)....

# Sort the array
  # ( lowest combo vale = first card )
  # sorted << min combo  (and delete min each time) -----  .delete_at(min)
