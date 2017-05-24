require 'tty-prompt'
require 'babbler'
require_relative 'cards'

class Blackjack

  attr_reader :name, :deck, :player, :options, :dealer_hand, :player_hand, :bet
  def initialize(game_options, player)
    @name = 'Blackjack'
    @options = game_options
    @player = player
    @deck = Deck.new
    @dealer_hand = []
    @player_hand = []
    @bet = 0
  end

  def start_game

    puts `clear`
    puts 'Welcome to BlackJack!'
    if player.is_drunk?
      puts "You are drunk"
      prompt = TTY::Prompt.new

      answer = prompt.select("\nYou can either?", ["Buy some coffee for $20", "Play it off"])

      if answer == "Buy some coffee for $20"
        player.wallet.remove_balance(20)
        player.drinks.clear
        puts "Enjoy your game."
        play_game
      elsif answer == "Play it off"
        puts "#{Babbler.babble()} #{Babbler.babble()} #{Babbler.babble()} #{Babbler.babble()} #{Babbler.babble()}......"
        sleep(1)
        puts "#{Babbler.babble()} #{Babbler.babble()}  #{Babbler.babble()}......"
        sleep(1)
        puts "#{Babbler.babble()} #{Babbler.babble()} #{Babbler.babble()} #{Babbler.babble()}......\n\n"
        random_num = (-player.wallet.get_balance..player.wallet.get_balance).to_a.sample
        if random_num < 0
          puts "You can't remember what happended but..."
          sleep(4)
          puts "You lost $#{random_num}"
          player.wallet.remove_balance(random_num)
          puts "Your balance now is #{player.wallet.get_balance}"
          sleep(6)
          options.display_menu_of_games
        elsif random_num > 0
          puts "You can't remember what happended but..."
          sleep(4)
          puts "You won $#{random_num}"
          player.wallet.add_money(random_num)
          puts "Your balance now is #{player.wallet.get_balance}"
          sleep(6)
          options.display_menu_of_games
        else
          puts "You can't remember what happended but..."
          sleep(6)
          puts "I think you had fun"
          sleep(5)
          options.display_menu_of_games
        end
      end

    else
      play_game
    end
  end

  def play_game
    place_bet

    deck.shuffle_cards

    dealer_hand << deck.cards.pop
    player_hand << deck.cards.pop
    dealer_hand << deck.cards.pop
    player_hand << deck.cards.pop

    puts "Dealing cards for you and the dealer."
    print '.'
    sleep(1)
    print '.'
    sleep(1)
    print ". \n\n"
    sleep(1)

    puts "The dealer's hand is:"
    dealer_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
    print "Total: #{count_total(dealer_hand)}"

    puts "\n-----------------------"
    puts "Your hand is :"
    player_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
    puts "Total: #{count_total(player_hand)}"

    if count_total(dealer_hand) == 21 || count_total(player_hand) == 21
      end_game
    end


    puts "\n\nIt is your turn."
    player_hit_or_stay

    sleep(2)
    puts "\nIt is the dealers turn. (The dealer has to stay at anything above 17.)"
    sleep(1)
    dealer_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
    print "Total: #{count_total(dealer_hand)}"

    dealer_hit_or_stay


    dealer_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
    print "Total: #{count_total(dealer_hand)}"

    end_game



  end

  def place_bet
    puts "How much do want to bet? Your current balance is #{player.wallet.get_balance}"

      player_bet = gets.chomp

    if player_bet.to_i <= player.wallet.get_balance
      if validate_bet?(player_bet)
        @bet = player_bet.to_i
      else
        put 'Invalid response, try again.'
        place_bet
      end
    else
      puts "You don't have enough money, try again."
      place_bet
    end


  end

  def validate_bet?(bet)
    !!(bet =~ /^\d*\.?\d{1,2}$/)
  end

  def player_hit_or_stay

    prompt = TTY::Prompt.new
    answer = prompt.select("Would You Like to Hit or Stay?", ["Hit", "Stay"])

    # puts "\nWould you like to hit or stay?"
    # answer = gets.chomp.downcase

    if answer == 'Hit'
      player_hand << deck.cards.pop
      puts 'Your hand is now:'
      player_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
      puts "Total: #{count_total(player_hand)}"
      if count_total(player_hand) > 21
        end_game
      else
        player_hit_or_stay
      end

    elsif answer == 'Stay'
      puts "\nYou have decided to stay with the following hand."
      player_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
      puts "Total: #{count_total(player_hand)}"
    else
      "Invalid response, try again."
      player_hit_or_stay
    end
  end

  def count_total(array_of_cards)
    total = 0
    aces = 0
    array_of_cards.each do |card|

      case card.rank
        when "K", "Q", "J"
          total += 10
        when "A"
          aces += 1
        else
          total += card.rank.to_i
      end
    end
    aces.times do
      if (total + 11) <= 21
        total += 11
      else
        total += 1
      end
    end
    total
  end

  def dealer_hit_or_stay
    while count_total(dealer_hand) < 17
      puts "\n\nDealer hits"
      dealer_hand << deck.cards.pop
      dealer_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
      print "Total: #{count_total(dealer_hand)}"
      if count_total(dealer_hand) > 21
        dealer_hand.each { |card| print "| #{card.rank} of #{card.suit} | " }
        print "Total: #{count_total(dealer_hand)}"
        end_game
      sleep(1)
      end
    end
    puts "\n\nDealer stays."
    sleep(1)
  end

  def end_game

    if count_total(player_hand) > 21
      puts "\n\nYou went over, you LOSE."
      player.wallet.remove_balance(bet)
      display_menu
    elsif count_total(dealer_hand) > 21
      puts "\n\nDealer went over, you WIN!"
      player.wallet.add_money(bet)
      display_menu
    elsif count_total(dealer_hand) > count_total(player_hand)
      puts "\n\nDealer is closer to 21, you LOSE."
      player.wallet.remove_balance(bet)
      display_menu
    elsif count_total(dealer_hand) < count_total(player_hand)
      puts "\n\nYou are closer to 21, you WIN."
      player.wallet.add_money(bet)
      display_menu
    else
      puts "\n\nYou tied, you get your money back."
      display_menu
    end

  end

  def display_menu
    sleep(3)
    prompt = TTY::Prompt.new

    answer = prompt.select("\nWould you like to play again?", ["Yes", "No"])


    if answer == 'Yes'
      reset_deck
      puts `clear`
      play_game
    elsif answer == 'No'
      puts "Goodbye"
      puts `clear`
      options.display_menu_of_games
    end
  end


  def reset_deck
      deck.cards = deck.cards + player_hand + dealer_hand
      player_hand.clear
      dealer_hand.clear
  end

end
