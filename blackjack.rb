
class Blackjack

  attr_reader :name
  def initialize(game_options, player)
    @name = 'Blackjack'
    @options = game_options
  end

  def start_game
    puts "Starting game #{name}"
  end
end
