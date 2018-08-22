require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'


class DeckTest < Minitest::Test
  def test_it_exists
    card = Card.new("3", "Hearts")
    assert_instance_of Deck, Deck.new(card)
  end

  def test_it_has_instance_variables
    card = Card.new("3", "Hearts")
    deck = Deck.new(card)
    assert_equal card, deck.cards
  end

  def test_it_can_add_cards_to_deck
    card_1 = Card.new("3", "Hearts")
    card_2 = Card.new("Queen", "Spades")
    deck = Deck.new([card_1])
    deck.add_card(card_2)
    assert_equal 2, deck.cards.count
  end

  def test_it_can_count_the_number_of_cards_in_the_deck
    # Cards is an array, the values and types don't matter here,
    # the number of elements cards holds matters.
    # FEEDBACK ? -- is it better to create 3 cards here?
    deck = Deck.new(["", "", ""])
    assert_equal 3, deck.count
  end

  def test_it_can_sort_the_deck
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])

    sorted = deck.sort
    expected = [card_1, card_3, card_2, card_5, card_4]

    assert_equal expected, sorted
  end


end
