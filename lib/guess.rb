# Create a class for the Guess functionality

require 'pry'

require './lib/card'


class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def convert_card_value_to_sentence
    card.value + " of " + card.suit
  end

  def correct?
    valid = false
    if response == convert_card_value_to_sentence
      valid = true
    end
    return valid
  end

  def feedback
    answer = ""
    # correctness = correct?
    if correct? == true
      p answer = "Correct!"
    else
      p answer = "Incorrect."
    end
    return answer
  end


end

# card = Card.new("10", "Hearts")
# guess = Guess.new("10 of Hearts", card)
# binding.pry
