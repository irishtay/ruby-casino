class RussianRoulette

  attr_reader :name, :possibilities, :options, :player


  def initialize(gaming_options, player)
    @name = 'Russian Roulette'
    @options = gaming_options
    @possibilities = ['click', 'click', 'click', 'click', 'click', 'bang']
    @player = player
  end

  def start_game
    puts "...Are you sure you want to play? (Y/N?)"
      answer = gets.chomp.downcase
        if answer == 'y' || answer == 'yes'
          play_new_game
          options.display_menu_of_games
        elsif answer == 'n' || answer == 'no'
          print '.'
          sleep(1)
          print '.'
          sleep(1)
          print '.'
          sleep(1)
          puts "Pansy"
          sleep (1)
          puts `clear`
          options.display_menu_of_games
        else
          puts 'Invalid option, try again.'
          start_game
        end
    end

    def play_new_game
      sleep (1)
      puts "...Alrighty then, place your bet, your current balance is #{player.wallet.get_balance}."

      answer = gets.chomp.to_i
      if answer <= player.wallet.get_balance
      puts "Spin the wheel, gun to head!"
      sleep(1)
      #need cylinder spinning sound effect followed by ..............
      puts "? Come on, pull the trigger.(Press Enter)"
      gets
      sleep(3)

      #mulitple sound effects here. If result = click (sound effect click), if bang = gunshot
        result = possibilities.sample
          if result == 'click'
            puts "WINNNNNNNNNNNNER!!!!"
            player.wallet.add_money(answer * 2)
            sleep(1)
            puts "Congradulations, "
            puts "Would you like to:"
            puts "1) Play again?(#{player.wallet.get_balance})?"
            puts "2) Double down....Dooooooo iiiiiiit (Add a bullet :) )"
            puts "3) Quit while you have a head"
             answer = gets.chomp
             case answer
              when '1'
                play_new_game
              when '2'
                possibilities[0] = 'bang'
                play_new_game
                possibilities[0] = 'click'
              when '3'
                options.display_menu_of_games
              else
                puts "Invalid input, try again"
              end

          else
            #Pac man dying sound effect
            sleep (1)
            puts "You're Dead"
            exit
          end
      else
        puts 'You do not have enough money'
        play_new_game
      end
    end
end
