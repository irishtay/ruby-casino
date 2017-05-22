
require_relative 'wallet'

class Player


    attr_accessor :wallet, :name, :age

    def initialize (wallet)
       @wallet = wallet
       get_player_info
    end

    def get_player_info
        puts 'What is your name?'
        name = gets.strip
        puts 'How old are you?'
        age = gets.strip
        puts 'How much money do you have?'
        wallet.add_money = gets.strip.to_i
    end

    def check_bet(bet)
        if bet > wallet.get_balance
            return false
        elsif wallet.get_balance == 0
            #create callateral
        else
            return true
        end
    end
>>>>>>> 4ca41831e9bc7a79568320c12f959cad567ac2ee

end
