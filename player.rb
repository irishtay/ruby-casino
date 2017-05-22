
require_relative 'wallet'

class Player


    attr_accessor :wallet, :name, :age

    def initialize (wallet)
       @wallet = wallet
       get_player_info
    end

    def get_player_info
        puts 'What is your name?'
        @name = gets.strip

        puts 'How old are you?'
        temp_age = gets.strip.to_i
        check_age(temp_age)
        puts 'How much money do you have?'
        temp_balance = gets.strip.to_i
        check_balance(temp_balance)


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

    def check_age(temp_age)
        if temp_age < 18
            puts 'GTFO'
            exit
        else
            @age = temp_age
        end
    end

    def check_balance(temp_balance)
        if temp_balance <= 100
            puts 'GTFO'
            exit
        else
            wallet.add_money(temp_balance)
        end
    end
end
