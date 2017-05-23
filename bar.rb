require 'tty-prompt'
require 'pry'

require_relative 'drink'

class Bar

    attr_accessor :drinks, :casino, :player
    def initialize(casino, player)
        @casino = casino
        @player = player
        @drinks = []
        drinks << Drink.new( { name: 'Beer', cost: 15 } )
        drinks << Drink.new( { name: 'Wine', cost: 21 } )
    end

    def purchase_drink
        prompt = TTY::Prompt.new
        puts "Your current balance is #{player.wallet.get_balance}"

        answer = prompt.select("What would you like to buy?", [ (drinks.map { |drink| "#{drink.name} ($#{drink.cost})"  }), "Return to the casino"])

        case answer
            when 'Beer'
                selected_drink = drinks[0].clone
                player.drinks << selected_drink
                player.wallet.remove_balance(selected_drink.cost)
                puts `clear`
                leave
            when 'Wine'
                selected_drink = drinks[0].clone
                player.drinks << selected_drink
                player.wallet.remove_balance(selected_drink.cost)
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
    
end