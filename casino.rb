require 'pry'
require 'colorize'

require_relative 'player'


class Casino
    attr_reader :player

    def initialize
        puts "Welcome to our Ruby Casino!"
        @player = Player.new ( { wallet: Wallet.new, name: "John" } )
    end
end



casino = Casino.new
puts casino.player.wallet.balance