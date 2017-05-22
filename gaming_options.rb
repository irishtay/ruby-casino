require_relative 'blackjack'
require_relative 'russianroulette'

class Gaming_options

  def initialize(player)
    @games = []
    @games << Blackjack.new(self, player)
    @games << RussianRoulette.new(self, player)
    # Add New Games Here

  end

  def display_menu_of_games
    puts 'Select a Game'
    @games.each_with_index { |game, index| puts "#{index.to_i + 1}) #{game.name}"}

    game_selection = gets.strip.to_i

    case game_selection
    when 1
        @games[game_selection - 1].start_game
    when 2
        @games[game_selection - 1].start_game
    end

  end


end
