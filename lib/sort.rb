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

class Sort
  attr_reader :deck, :value_order, :suit_order

  def initialize(deck)
    @deck = deck
    @value_order = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
    @suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
  end

  # ########################################

  def sort_deck
    # give an integer value to each card
    # each int will be unit
    # index_value_order (joined) index_suit_order
    # convert to int
    # make unique int value a key, value = card instance
    # keys to new array
    # sort keys by value
    # create sorted array []
    # for each key, look up the value (card), shovel into sorted array
  end

  # ########################################

  def rank_card

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
