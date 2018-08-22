# Create a class for the round functionality
require 'pry'

require './lib/card.rb'
require './lib/guess.rb'
require './lib/deck.rb'


class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @deck_index = 0
    @guesses = []
  end

  def current_card
    return @deck.cards[@deck_index]
  end

  def record_guess(guess = {})
    response_string = guess[:value] + " of " + guess[:suit]
    guessed = Guess.new(response_string, current_card)
    @guesses << guessed
    move_to_next_card
    return guessed
  end

    def move_to_next_card
      @deck_index = @deck_index + 1
    end

  def number_correct
    correct = 0
    guesses.each do |guess|
      guess_response = guess.response
      real_response = guess.convert_card_value_to_sentence
      if guess_response == real_response
        correct = correct + 1
      end
    end
    return correct
  end

  def percent_correct
    (number_correct.to_f / @guesses.count) * 100
  end

end
