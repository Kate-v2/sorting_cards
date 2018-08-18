require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    actual = Card.new("Ace", "Spades")
    assert_instance_of Card, actual
  end

  def test_it_can_validate_card
    card_1 = Card.new("Ace", "Spades")
    actual_1 = card_1.validate_card
    expected_1 = true
    assert_equal expected_1, actual_1

    card_2 = Card.new("A", "Spades")
    actual_2 = card_2.validate_card
    expected_2 = false
    assert_equal expected_2, actual_2

    card_3 = Card.new("Ace", "Spade")
    actual_3 = card_3.validate_card
    expected_3 = false
    assert_equal expected_3, actual_3
  end

  def test_it_can_validate_value
    card_pass = Card.new("Ace", "Spades")
    actual_pass = card_pass.validate_value
    expect_pass = true
    assert_equal expect_pass, actual_pass

    card_fail = Card.new("A", "Spades")
    actual_fail = card_fail.validate_value
    expect_fail = false
    assert_equal expect_fail, actual_fail
  end

  def test_it_can_validate_suit
    card_pass = Card.new("Ace", "Spades")
    actual_pass = card_pass.validate_suit
    expect_pass = true
    assert_equal expect_pass, actual_pass

    card_fail = Card.new("Ace", "pades")
    actual_fail = card_fail.validate_suit
    expect_fail = false
    assert_equal expect_fail, actual_fail
  end

end
