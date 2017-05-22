
require_relative 'wallet'

class Player

    attr_accessor :name, :age, :wallet

    def initialize
      @name = name
      @wallet = wallet
      @age = age
      get_info
    end

    def get_info
      puts 'What is your name?'
      gets.string
      puts "What's in your wallet?"
      gets.string.to_i
      puts "How old are you?"
      gets 



end
