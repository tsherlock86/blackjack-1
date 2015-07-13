require './card'

class Deck
  attr_accessor :cards

  def initialize
    # when you use the shorthand you do not need commas.
    suit = %w(Hearts Diamonds Clubs Spades)
    value = (2..10).to_a
    @cards = []
    suit.each do |suit|
      value.each do |value|

        @cards << Card.new(suit, value, value)
      end
    #Just spelling it out so it looks nicer in terminal.
    @cards << Card.new(suit, 10, "Jack")
    @cards << Card.new(suit, 10,  "Queen")
    @cards << Card.new(suit, 10, "King")
    @cards << Card.new(suit, 11, "Ace")
    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

end
