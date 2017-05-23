require 'tty-prompt'
require 'pry'

require_relative 'item'

class Giftshop

    attr_reader :casino, :player, :items
    def initialize(casino, player)
        @casino = casino
        @player = player
        @items = []
        items << Item.new( {name: 'I Survived Russian Rouleete T-Shirt', cost: 25.00} )
        items << Item.new( {name: 'I lost all my money Coffee Mug', cost: 15.00})
        items << Item.new( {name: 'I had to buy this stupid key chain to leave', cost: 12.95} )
    end

    def display_menu

        prompt = TTY::Prompt.new
        puts `clear`
        puts "Welcome to the casino gift shop."
        puts "Please take your time and select one of our fine souvenirs. Your current balance is #{player.wallet.get_balance}"
        menu_selection = prompt.select("What would you like to buy?", [(items.map { |item| item.name }), "Go back to the Casino"])

        case menu_selection
            when 'I Survived Russian Rouleete T-Shirt'
                purchased_item = items[0].clone
                player.wallet.remove_balance(purchased_item.cost)
                player.purchased_items << purchased_item
                puts `clear`
                puts "Thank you for your purchase. Your balance is now #{player.wallet.get_balance}"
                exit_casino
            when 'I lost all my money Coffee Mug'
                purchased_item = items[1].clone
                player.wallet.remove_balance(purchased_item.cost)
                player.purchased_items << purchased_item
                puts `clear`
                puts "Thank you for your purchase. Your balance is now #{player.wallet.get_balance}"
                exit_casino
            when 'I had to buy this stupid key chain to leave'
                purchased_item = items[2].clone
                player.wallet.remove_balance(purchased_item.cost)
                player.purchased_items << purchased_item
                puts `clear`
                puts "Thank you for your purchase. Your balance is now #{player.wallet.get_balance}"
                exit_casino
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


end
