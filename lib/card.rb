# Create a class for the card object
require 'pry'


class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    @allowed_values = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
    @allowed_suits = ["Spades", "Hearts", "Diamonds", "Clubs"]
  end

  def validate_card
    valid = validate_value == true && validate_suit == true
    if valid == false
      p "Incorrect entry of playing card value and/or suit."
    end
    return valid
  end

  def validate_value
    valid = false
    @allowed_values.find do |val|
      valid = @value == val
    end
    return valid
  end

  def validate_suit
    valid = false
    @allowed_suits.find do |s|
      valid = @suit == s
    end
    return valid
  end

end
