require 'pry'

require 'minitest/autorun'
require 'minitest/pride'

require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'
require './lib/round.rb'


class RoundTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    assert_instance_of Round, Round.new(deck)
  end

  def test_it_can_get_deck_attributes
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal deck, round.deck
    assert_equal [], round.guesses
  end

  def test_it_can_identify_the_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal card_1, round.current_card
  end

  def test_it_can_record_the_guess_attempt
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = round.record_guess({value: "Jack", suit: "Diamonds"})
    guess_response = guess.response
    guess_card = guess.card
    # Instances of classes are different because
    # the two objects have different IDs.
    # Therefore, we compare the attributes.
    expected = Guess.new("Jack of Diamonds", deck.cards[0])
    expected_response = "Jack of Diamonds"
    expected_card = deck.cards[0]
    assert_equal expected_response, guess_response
    assert_equal expected_card, guess_card
  end

  def test_it_can_move_to_next_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    assert_equal 1, round.move_to_next_card
  end

  def test_it_can_count_the_number_of_times_it_guessed
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 1, round.guesses.count
  end

  def test_it_can_get_feedback_on_the_first_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    # Test a matching guess
    round_true = Round.new(deck)
    round_true.record_guess({value: "3", suit: "Hearts"})
    feedback_true = round_true.guesses.first.feedback
    assert_equal "Correct!", feedback_true
    # Test a mismatched guess
    round_false = Round.new(deck)
    round_false.record_guess({value: "Jack", suit: "Diamonds"})
    feedback_false = round_false.guesses.first.feedback
    assert_equal "Incorrect.", feedback_false
  end

  def test_it_can_count_the_number_of_correct_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("Jack", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess_1_true = round.record_guess({value: "3", suit: "Hearts"})
    guess_2_false = round.record_guess({value: "Jack", suit: "Diamonds"})
    guess_3_true = round.record_guess({value: "Jack", suit: "Diamonds"})
    assert_equal 2, round.number_correct
  end

  def test_it_can_get_feedback_on_the_last_guess
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess({value: "3", suit: "Hearts"})
    feedback = round.guesses.last.feedback
    assert_equal "Correct!", feedback
  end

  def test_it_can_give_the_percent_of_guesses_correct
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    # All correct:
    round_1 = Round.new(deck)
    round_1.record_guess({value: "3", suit: "Hearts"})
    round_1.record_guess({value: "4", suit: "Clubs"})
    assert_equal 100, round_1.percent_correct
    # Half correct:
    round_2 = Round.new(deck)
    round_2.record_guess({value: "3", suit: "Hearts"})
    round_2.record_guess({value: "5", suit: "Clubs"})
    assert_equal 50, round_2.percent_correct
  end

end
