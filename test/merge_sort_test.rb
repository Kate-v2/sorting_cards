require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card'
require './lib/deck'
require './lib/merge_sort'


# card_1 = Card.new("4","Hearts")
# card_2 = Card.new("Jack", "Clubs")
# card_3 = Card.new("5", "Diamonds")
# card_4 = Card.new("Ace", "Spades")
# card_5 = Card.new("Ace", "Diamonds")
# deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
# sort = MergeSort.new(deck)
#
# expected = [card_1, card_3, card_2, card_5, card_4]



class MergeSortTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    to_sort = MergeSort.new(deck)
    assert_instance_of MergeSort, to_sort
  end

  def test_it_gets_attributes
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    to_sort = MergeSort.new(deck)
    assert_equal deck, to_sort.deck
  end

  # ################################

  def test_it_ranks_all_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    to_sort = MergeSort.new(deck)
    ranked_cards = to_sort.rank_all_cards
    expected = {22 => card_1, 90 => card_2, 31 => card_3}
    assert_equal expected, ranked_cards
  end

  def test_it_can_rank_each_card
    card_1 = Card.new("4","Hearts")
    deck = Deck.new([card_1])
    to_sort = MergeSort.new(deck)
    assert_equal 22, to_sort.rank_card(card_1)
  end

  def test_it_can_order_cards
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    to_sort = MergeSort.new(deck)
    hash = to_sort.rank_all_cards
    sorted_keys = to_sort.sorting(hash.keys)
    sorted = to_sort.order_cards(sorted_keys, hash)

    expected = [card_1, card_3, card_2, card_5, card_4]
    assert_equal expected, sorted
  end

  # ################################

  def test_it_sorts
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    to_sort = MergeSort.new(deck)
    sorted = to_sort.sort

    expected = [card_1, card_3, card_2, card_5, card_4]
    assert_equal expected, sorted
  end

  def test_it_tries_sorting
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    to_sort = MergeSort.new(deck)
    ranked_keys = to_sort.rank_all_cards.keys
    trying_to_sort = to_sort.sorting(ranked_keys)
    assert_equal [22, 31, 90, 121, 123], trying_to_sort
  end

  def test_it_splits_forming_the_left_side
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    to_sort = MergeSort.new(deck)
    left = to_sort.split_left(deck.cards)
    assert_equal [card_1, card_2], left
  end

  def test_it_splits_forming_the_right_side
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("Jack", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    card_4 = Card.new("Ace", "Spades")
    card_5 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3, card_4, card_5])
    to_sort = MergeSort.new(deck)
    right = to_sort.split_right(deck.cards)
    assert_equal [card_3, card_4, card_5], right
  end

  def test_it_can_merge_arrays_to_be_sorted
    deck = Deck.new([])
    to_sort = MergeSort.new(deck)
    left = [1, 3, 8]
    right = [4, 7, 9]
    actual = to_sort.merge(left, right)
    expected = [1, 3, 4, 7, 8, 9]
    assert_equal expected, actual
  end


end
