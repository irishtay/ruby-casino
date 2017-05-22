require_relative 'blackjack'

class Gaming_options

  def initialize
    @games = []
    @games << Blackjack.new
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

    end

  end


end
