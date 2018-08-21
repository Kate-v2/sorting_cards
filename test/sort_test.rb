require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/deck'
require './lib/sort'

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
    val_order = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
    suit_order = ["Clubs", "Diamonds", "Hearts", "Spades"]
    assert_equal deck, sort.deck
    assert_equal val_order, sort.value_order
    assert_equal suit_order, sort.suit_order
  end

  # ########################################

  def test_it_sorts_the_deck
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    sort = Sort.new(deck)

    sorted = sort.sort_deck
    expected = [card_1, card_3, card_2, card_5, card_4]

    assert_equal expected, sorted
  end

  # ########################################

  def test_it_creates_a_hash_of_ranked_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    deck = Deck.new([card_1, card_2])
    sort = Sort.new(deck)

    ranked = sort.rank_all_cards
    expected = {22 => card_1, 90 => card_2}

    assert_equal expected, ranked
  end

  def test_it_can_rank_a_card
    card_1 = Card.new("4","Hearts")
    deck = Deck.new([card_1])
    sort = Sort.new(deck)
    ranked = sort.rank_card(deck.cards[0])
    assert_equal 22, ranked
  end

  def test_it_can_sort_keys
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    deck = Deck.new([card_1, card_2])
    sort = Sort.new(deck)
    ranked = sort.rank_all_cards
    assert_equal [22, 90], sort.sort_keys(ranked)
  end

  def test_it_can_order_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    sort = Sort.new(deck)
    ranked = sort.rank_all_cards
    keys = sort.sort_keys(ranked)
    sorted = sort.order_cards(keys, ranked)
    # -----------------------------------
    expected = [card_1, card_3, card_2, card_5, card_4]
    assert_equal expected, sorted
  end


end
