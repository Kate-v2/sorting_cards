require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def test_it_exists
    actual = Guess.new("10 of Hearts", ["10", "Hearts"])
    assert_instance_of Guess, actual
  end

  def test_it_gets_instance_variables
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal card, guess.card
    assert_equal "10 of Hearts", guess.response
  end

  def test_it_can_convert_card_value_to_sentence
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal "10 of Hearts", guess.convert_card_value_to_sentence
  end

  def text_it_can_compare_real_and_guessed_correctness
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    assert_equal true, guess.correct?
  end

  def test_it_can_print_feedback_about_response
    card = Card.new("10", "Hearts")
    guess_1 = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess_1.feedback

    guess_2 = Guess.new("0 of Hearts", card)
    assert_equal "Incorrect.", guess_2.feedback
  end

end
