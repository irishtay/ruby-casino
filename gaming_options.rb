require 'tty-prompt'
require 'pry'
require_relative 'blackjack'
require_relative 'russianroulette'

class Gaming_options

  def initialize(player)
    @games = []
    @games << Blackjack.new(self, player)
    @games << RussianRoulette.new(self, player)
    @games << Slots.new(self, player)
    # Add New Games Here

  end

  def display_menu_of_games
    puts `clear`
    prompt = TTY::Prompt.new
    game_selection = prompt.select("Select a game you would like to play", @games.map {|game| game.name})


    binding.pry
    case game_selection
    when 'Blackjack'
        @games[0].start_game
    when 'Russian Roulette'
        @games[1].start_game
    when 'Slots'
        @games[2].start_game
    end

  end


end
