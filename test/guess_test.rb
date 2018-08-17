require "pry"

require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def test_it_exists
    actual = Guess.new("10 of Hearts", ["10", "Hearts"])
    assert_instance_of Guess, actual
  end


end
