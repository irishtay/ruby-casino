require 'tty-prompt'
require_relative 'wallet'

class Player


    attr_accessor :wallet, :name, :age

    def initialize (wallet)
       @wallet = wallet
       get_player_info
    end

    def get_player_info
        
        prompt = TTY::Prompt.new


        name = prompt.ask('What is your Name?') do |q| 
            q.required true
            q.modify :capitalize
        end

        age = prompt.ask('What is your age?') do |q| 
            q.required true
            q.convert :int
            q.validate(/^\d{1,2}$/, "Invalid age, try again")
        end

        wallet = prompt.ask('How much money do you have?') do |q| 
            q.required true
            q.convert :int
            q.validate(/^\d*\.?\d{1,2}$/, "Invalid amount, try again")
        end
    
        check_balance(wallet)
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
