require 'pry'
require 'colorize'

require_relative 'player'


class Casino
    attr_reader :player

    def initialize
        puts "Welcome to our Ruby Casino!"
        @player = Player.new ( { wallet: Wallet.new, name: "John" } )
        casino_menu
    end


    def casino_menu
        
    end
end



casino = Casino.new
puts casino.player.wallet.balance