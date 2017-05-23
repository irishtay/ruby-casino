require 'pry'
require 'tty-prompt'

class Slots

  attr_reader :name, :player, :reel, :options

  def initialize(gaming_options, player)
    @name = 'Slots'
    @options = gaming_options
    @player = player
    @reel = ['apple', 'cherry', 'clover', 'heart', 'diamond', 'bar', 'coin']
    @reel1 = ""
    @reel2 = ""
    @reel3 = ""
    @play_result = ""
  end

  def start_game
    puts `clear`
    puts "Welcome To Slots!"
    puts "Your Current Balance is #{player.wallet.get_balance}"
    puts "$1 to Play \n"

    puts "-------------"

    prompt = TTY::Prompt.new
    play_option = prompt.select("Make a Selection", ["Pull Lever", "Select New Game"])

    if play_option == "Select New Game"
      options.display_menu_of_games
    end

    pid = fork{ exec 'afplay', "slots_lever.mp3" }

    sleep(1)

    player.wallet.remove_balance(1)

    @reel1 = @reel.sample.capitalize
    @reel2 = @reel.sample.capitalize
    @reel3 = @reel.sample.capitalize


        sleep(1)
        pid = fork{ exec 'afplay', "reel_click.mp3" }
        print "\n#{@reel1}  "
        sleep(1)
        pid = fork{ exec 'afplay', "reel_click.mp3" }
        print "#{@reel2}  "
        sleep(1)
        pid = fork{ exec 'afplay', "reel_click.mp3" }
        print "#{@reel3} \n\n"

        sleep(1)

    @play_result = "#{@reel1} || #{@reel2} || #{@reel3}"

    results

    puts "Your New Balance is #{player.wallet.get_balance}"

  end

  def slots_menu
    prompt = TTY::Prompt.new
    slots_menu_answer = prompt.select("What's Next?", ["Play Again", "Exit"])


    case slots_menu_answer
    when "Play Again"
        start_game
      when "Exit"
        options.display_menu_of_games
      else
        puts "Invalid input, try again"
    end

  end

  def results
    reel_array = [@reel1, @reel2, @reel3]
    if @play_result == "Bar || Bar || Bar"
      pid = fork{ exec 'afplay', "money_drop.mp3" }
      puts "JACKPOT: 1 Million Dollars!"
      puts "------"
      player.wallet.add_money(1000000)
      puts "Your Balance is now #{player.wallet.get_balance}\n\n"

    elsif reel_array[0] == reel_array[1] && reel_array[1] == reel_array[2] && reel_array != ["bar", "bar", "bar"]
      puts "3 of a Kind: $100"
      puts "------"
      player.wallet.add_money(100)
      puts "Your Balance is now #{player.wallet.get_balance}\n\n"

    elsif
      reel_array.count("Apple") == 2 ||
      reel_array.count("Diamond") == 2 ||
      reel_array.count("Orange") == 2 ||
      reel_array.count("Cherry") == 2 ||
      reel_array.count("Bell") == 2 ||
      reel_array.count("Grapes") == 2 ||
      reel_array.count("Clover") == 2 ||
      reel_array.count("Heart") == 2 ||
      reel_array.count("Bar") == 2 ||
      reel_array.count("Coin") == 2 ||
      reel_array.count("Lemmon") == 2

      puts "2 of a Kind: $10"
      puts "------"
      player.wallet.add_money(10)
      puts "Your Balance is now #{player.wallet.get_balance}\n\n"


    elsif reel_array.include?("Diamond")
      puts "You Got Diamonds: $1"
      puts "------"
      player.wallet.add_money(1)
      puts "Your Balance is now #{player.wallet.get_balance}\n\n"

    else
      pid = fork{ exec 'afplay', "sad_tromboine.mp3" }
      puts "Better Luck Next Time \n\n"
    end
  slots_menu

  end

end
