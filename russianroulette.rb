
class RussianRoulette

  attr_reader :name, :possibilities, :options, :player


  def initialize(gaming_options, player)
    @name = 'Russian Roulette'
    @options = gaming_options
    @possibilities = ['click', 'click', 'click', 'click', 'bang', 'bang']
    @player = player
  end

  def start_game

    prompt = TTY::Prompt.new
    play_option = prompt.select("Are You Sure You Want To Play #{name}, #{player.name}", ["Yes", "No"])

    if play_option == "No"
      puts "pansy"
      sleep(1)
      options.display_menu_of_games
    end

    play_new_game
    options.display_menu_of_games

  end

    # puts "...Are you sure you want to play? ()"
    #   answer = gets.chomp.downcase
    #     if answer == 'y' || answer == 'yes'
    #       play_new_game
    #       options.display_menu_of_games
    #     elsif answer == 'n' || answer == 'no'
    #       print '.'
    #       sleep(1)
    #       print '.'
    #       sleep(1)
    #       print '.'
    #       sleep(1)
    #       puts "Pansy"
    #       sleep (1)
    #       puts `clear`
    #       options.display_menu_of_games
    #     else
    #       puts 'Invalid option, try again.'
    #       start_game
    #     end
    # end

    def play_new_game
      sleep (1)
      puts "Alright, Place Your Bet"
      puts "Your Current Balance is #{player.wallet.get_balance}."
      answer = gets.chomp.to_i

      if answer <= player.wallet.get_balance
      puts "\nSpin the Cylinder (Press Enter)"
      gets
      sleep(1)
      puts "Gun To Head"
      #need cylinder spinning sound effect followed by ..............
      print '.'
      sleep(1)
      print '.'
      sleep(1)
      print ". \n"
      sleep(1)


      #mulitple sound effects here. If result = click (sound effect click), if bang = gunshot
        result = possibilities.sample
          if result == 'click'
            puts "\nCongratulations #{player.name}, you've survived!\n\n"
            player.wallet.add_money(answer * 2)
            prompt = TTY::Prompt.new
            play_option = prompt.select("What's Next?", ["Play Again", "Double Down", "Quit While You're Alive"])

            if play_option == "Quit While You're Alive"
              options.display_menu_of_games
            elsif play_option == "Double Down"
              possibilities[0] = 'bang'
              possibilities[1] = 'bang'
              play_new_game
              possibilities[0] = 'click'
              puts `clear`
            end

            puts `clear`
            play_new_game



            # puts "Would you like to:"
            # puts "1) Play again?(#{player.wallet.get_balance})?"
            # puts "2) Double down....Dooooooo iiiiiiit (Add a bullet :) )"
            # puts "3) Quit while you have a head"
            #  answer = gets.chomp
            #  case answer
            #   when '1'
            #     play_new_game
            #   when '2'
            #     possibilities[0] = 'bang'
            #     play_new_game
            #     possibilities[0] = 'click'
            #   when '3'
            #     options.display_menu_of_games
            #   else
            #     puts "Invalid input, try again"
            #   end

          else
            #Pac man dying sound effect
            sleep (1)
            puts "BANG! You're Dead!"
            sleep(2)
            puts `pmset sleepnow`
          end
      else
        puts 'You do not have enough money'
        play_new_game
      end
    end
end
