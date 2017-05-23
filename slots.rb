require 'pry'

class Slots

  attr_reader :name, :player, :reel, :options

  def initialize(gaming_options, player)
    @name = 'Slots'
    @options = gaming_options
    @player = player
    @reel = ['apple', 'orange', 'cherry', 'bell', 'grapes', 'clover', 'heart', 'diamond', 'bar', 'coin', 'lemon']
  end

  def start_game
    puts 'Welcome To Slots!'
    puts "Your Current Balance is #{player.wallet.get_balance}"
    puts "Place Your Bet"
    bet = gets.strip.to_i

    puts 'Pull the Lever (Press Enter)'
    gets

    print '.'
    sleep(1)
    print '.'
    sleep(1)
    print ". \n\n"
    sleep(1)

    puts "#{@reel.sample.capitalize} || #{@reel.sample.capitalize} || #{@reel.sample.capitalize} \n\n"
    slots_menu
  end

  def slots_menu
    puts '1) Play Agian'
    puts '2) Exit'

    slots_menu_answer = gets.strip.to_i

    case slots_menu_answer
      when 1
        start_game
      when 2
        options.display_menu_of_games
      else
        puts "Invalid input, try again"
    end

  end

  def results
    
  end
end
