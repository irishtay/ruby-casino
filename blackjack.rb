
class Blackjack

  attr_reader :name
  def initialize
    @name = 'Blackjack'
  end

  def start_game
    puts "Starting game #{name}"
  end
end
