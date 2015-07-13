require './card'
require './deck'

class Game

  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = deck.cards.shift(2)
    @dealer = deck.cards.shift(2)
  end

  def play
    puts "Welcome to the Blackjack table!"
    puts "[Press Enter To Continue]"
    gets
    @player.each do |card|
      puts "Your card is a(n) #{card.face} of #{card.suit}."
    end
    puts "Your total score is #{player_score}."
    puts "The dealer's card is a(n) #{@dealer[0].face} of #{@dealer[0].suit}"
    if player_score < 21
      puts "Want to hit? [y/n]"
      desire = gets.chomp
        until desire != "y" || player_score >= 21
          player_hit
            @player.each do |card|
              puts "Your card is a(n) #{card.face} of #{card.suit}"
            end
              puts "Your total score is #{player_score}."
                if player_score > 21
                  puts "You busted. Better luck next time!"
                elsif player_score == 21
                  puts = "You win! Congratulations."
                else puts "Want to hit again? [y/n]"
                end
              desire = gets.chomp
        end
        if desire == "n"
          puts "Your total score is #{player_score}."
        end
    elsif player_score > 21
      puts "You busted. Better luck next time!"
    else player_score == 21
      puts "You win! Congratulations!"
    end

    if player_score > 21 || player_score == 21
      exit
    end

    until dealer_score > 15 || dealer_score > player_score
      dealer_hit
    end
    if dealer_score > 21
      puts "The dealer's score is #{dealer_score}. The dealer busted. You win!"
      exit
    end

    if player_score == dealer_score
      puts "Your score is #{player_score}. The dealer's score is #{dealer_score}. You win!"
    elsif player_score > dealer_score
      puts "Your score is #{player_score}. The dealer's score is #{dealer_score}. You win!"
    elsif player_score < dealer_score
      puts "Your score is #{player_score}. The dealer's score is #{dealer_score}. You lose!"

    end

  end



  def player_hit
    @player << deck.cards.shift
  end

  def dealer_hit
    @dealer << deck.cards.shift
  end

  def player_score
    @player.inject(0) {|sum, card| sum + card.value}
  end

  def dealer_score
    @dealer.inject(0) {|sum, card| sum + card.value}
  end

end

Game.new.play
