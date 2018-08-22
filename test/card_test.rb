require 'pry'

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    actual = Card.new("Ace", "Spades")
    assert_instance_of Card, actual
  end

  def test_it_gets_attributes
    card = Card.new("Ace", "Spades")
    assert_equal "Ace", card.value
    assert_equal "Spades", card.suit
  end

end
