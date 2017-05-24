require 'tty-prompt'
require 'pry'

require_relative 'drink'

class Bar

    attr_accessor :casino, :player
    def initialize(casino, player)
        @casino = casino
        @player = player
    end

    def purchase_drink
        prompt = TTY::Prompt.new
        puts "Your current balance is #{player.wallet.get_balance}"

        answer = prompt.select("What would you like to buy?", [ "Beer ($15)", "Wine ($21)", "Return to the casino"])

        case answer
            when 'Beer ($15)'
                buy_drink(Drink.new( { name: 'Beer', cost: 15 } ))
                pid = fork{ exec 'afplay', "open_beer_1.mp3" }
                puts `clear`
                leave
            when 'Wine ($21)'
                buy_drink(Drink.new( { name: 'Wine', cost: 21 } ))
                pid = fork{ exec 'afplay', "cork.mp3" }
                puts `clear`
                leave
            when 'Return to the casino'
                casino.display_menu
        end

    end

    def leave
        puts "Thank you for your purchase."

        prompt = TTY::Prompt.new

        answer = prompt.select("What do you want to do?", ['Buy another Drink', "Return to the casino"])

        case answer
            when 'Buy another Drink'
                purchase_drink
            when 'Return to the casino'
                casino.display_menu
        end

    end

    def buy_drink(drink)
        selected_drink = drink
        player.wallet.remove_balance(selected_drink.cost)
        player.drinks << selected_drink
    end
    

end
