require './card'

class Deck
  attr_accessor :cards

  def initialize
    suit = %w(Hearts, Diamonds, Clubs, Spades)
    value = (2..10).to_a
    @cards = []
    suit.each do |suit|
      value.each do |value|

        @cards << Card.new(suit, value, value)
      end

    @cards << Card.new(suit, 10, "J")
    @cards << Card.new(suit, 10,  "Q")
    @cards << Card.new(suit, 10, "K")
    @cards << Card.new(suit, 11, "A")
    end
    shuffle!
  end

  def shuffle!
    cards.shuffle!
  end

end
