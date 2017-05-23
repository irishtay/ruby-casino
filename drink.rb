
class Drink

    attr_accessor :name, :cost
    def initialize(args)
        @name = args[:name]
        @cost = args[:cost]
    end


end