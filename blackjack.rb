#Since you already have your class card setup in Deck.rb we wouldn't have to require './card'
require './deck'

class Game

  attr_accessor :player, :dealer, :deck

  def initialize
    @deck = Deck.new
    @player = deck.cards.shift(2)
    @dealer = deck.cards.shift(2)
  end
  #When calling your instance variable try to avoid using @.

  def play
    #Setup a method to check if see if the Blackjack at the beginning of the game.
    #Condensing code for your play method so you can call it when you need to.

    game_start
    if player_score < 21
      puts "Want to hit? [y/n]"
      desire = gets.chomp.downcase
      until desire != "y"
        player_hit
        player.each do |card|
          puts "Your card is a(n) #{card.face} of #{card.suit}"
          puts "Your total score is #{player_score}."
        end
        if player_score > 21
          puts "You busted. Better luck next time!"
        elsif player_score == 21
          puts  "You win! Congratulations."
        else
          puts "Please type y or n"
          desire == gets.chomp.downcase
        end
      end
      if desire == "n"
        puts "Your total score is #{player_score}."
        dealer_turn
      end
    end
  end
  #added a blackjack at start method to check if they win on there starting hand
  def win_or_bust
    if dealer_score == 21
      game_start
      puts "Dealer wins sorry no turn for you"
      exit
    elsif player_score == 21
      game_start
      puts "You Win! Congratulations"
      exit
    end
  end
  #Condensed the start of your game into a method.
  def game_start
    win_or_bust
    puts "Welcome to the Blackjack table! [Press Enter To Continue]"
    gets
    @player.each do |card|
      puts "Your card is a(n) #{card.face} of #{card.suit}."
    end
    puts "Your total score is #{player_score}."
    puts "The dealer's card is a(n) #{dealer[0].face} of #{dealer[0].suit}."
    puts "The dealer score is #{dealer_score}"
  end

 #setu a method for your dealers turn when your checking
  def dealer_turn
    determine_score
    until dealer_score >= 16
      dealer_hit
      if dealer_score > 21
        puts "Dealer busts...you win!"
        play_again
      elsif dealer_score < 20
        determine_score
      end
    end
  end

 #determines if dealer wins
  def determine_score
    if player_score == dealer_score
      puts "Your score is #{player_score}. The dealer's score is #{dealer_score}. You win!"
      play_again
    elsif player_score > dealer_score
      puts "Your score is #{player_score}. The dealer's score is #{dealer_score}. You win!"
      play_again
    elsif player_score < dealer_score
      puts "Your score is #{player_score}. The dealer's score is #{dealer_score}. You lose!"
      play_again
    end
  end

  #Setup a play method if the user wanted to play again.
  def play_again
    puts "Would you like to play again? y/n.."
    desire = gets.chomp.downcase
    if desire == "y"
      Game.new.play
    elsif desire == "n"
      exit
    else
      puts "Please type y or n"
      play_again
    end
  end

  def player_hit
    player << deck.cards.shift
  end

  def dealer_hit
    dealer << deck.cards.shift
  end

  def player_score
    player.inject(0){|sum, card| sum + card.value}
  end

  def dealer_score
    dealer.inject(0){|sum, card| sum + card.value}
  end

end

Game.new.play
