require 'tty-prompt'
require 'pry'

require_relative 'item'

class Giftshop

    attr_reader :casino, :player
    def initialize(casino, player)
        @casino = casino
        @player = player
    end

    def display_menu

        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to the casino gift shop."
        puts "Please take your time and select one of our fine souvenirs. Your current balance is #{player.wallet.get_balance}"

        menu_selection = prompt.select("What would you like to buy?", ['I Survived Russian Rouleete T-Shirt ($25)', 'I lost all my money Coffee Mug ($15)', 'I had to buy this stupid key chain to leave ($12)'])

        case menu_selection
            when 'I Survived Russian Rouleete T-Shirt ($25)'
                buy_item(Item.new( {name: 'I Survived Russian Rouleete T-Shirt', cost: 25} ))
            when 'I lost all my money Coffee Mug ($15)'
                buy_item(Item.new( {name: 'I lost all my money Coffee Mug', cost: 15}))
            when 'I had to buy this stupid key chain to leave ($12)'
                buy_item(Item.new( {name: 'I had to buy this stupid key chain to leave', cost: 12} ))
            when "Go back to the Casino"
                casino.display_menu
        end

    end

    def exit_casino
        new_prompt = TTY::Prompt.new
        answer = new_prompt.select("What would you like to do?", ["Buy another item", "Go back to the Casino", "Exit Casino"])
        case answer
            when "Buy another item"
                display_menu
            when "Go back to the Casino"
                casino.display_menu
            when "Exit Casino"
                puts `clear`
                puts "Goodbye, Please come again. Next time bring more money"
                exit
        end
    end

    def buy_item(item)
        purchased_item = item
        player.wallet.remove_balance(purchased_item.cost)
        player.purchased_items << purchased_item
        puts `clear`
        puts "Thank you for your purchase. Your balance is now #{player.wallet.get_balance}"
        exit_casino
    end


end
