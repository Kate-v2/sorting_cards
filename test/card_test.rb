require "pry"

require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test
  def test_it_exists
    actual = Card.new("Ace", "Spades")
    assert_instance_of Card, actual
  end


end
