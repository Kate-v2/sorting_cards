require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/sort'

# card_1 = Card.new("4","Hearts")
# card_2 = Card.new("Jack", "Clubs")
# card_3 = Card.new("5", "Diamonds")
# card_4 = Card.new("Ace", "Spades")
# card_5 = Card.new("Ace", "Diamonds")
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
# round = Round.new(deck)


class SortTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_instance_of Sort, Sort.new(deck)
  end

  def test_it_gets_attributes
    card_1 = Card.new("4","Hearts")
    deck = Deck.new([card_1])
    sort = Sort.new(deck)
    val_order = [2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
    suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
    assert_equal deck, sort.deck
    assert_equal val_order, sort.value_order
    assert_equal suit_order, sort.suit_order
  end

  # ########################################

  def test_it_sorts_the_deck
    # Must return array of Instances
  end

  # ########################################

  def

  end




end
