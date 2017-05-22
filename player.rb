
require_relative 'wallet'

class Player
    
    attr_accessor :wallet, :name

    def initialize (args)
       @wallet = args[:wallet] 
       @name = args[:name]
    end


end
