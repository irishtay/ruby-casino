require 'tty-prompt'
require 'pry'
require_relative 'blackjack'
require_relative 'russianroulette'
require_relative 'slots'

class Gaming_options

  attr_reader :casino

  def initialize(player, casino)
    @games = []
    @games << Blackjack.new(self, player)
    @games << RussianRoulette.new(self, player)
    @games << Slots.new(self, player)
    @casino = casino

    # Add New Games Here

  end

  def display_menu_of_games
    puts `clear`
    prompt = TTY::Prompt.new
    game_selection = prompt.select("Select a game you would like to play", [@games.map {|game| game.name}, "Return to Main Menu"])


    case game_selection
    when 'Blackjack'
        @games[0].start_game
    when 'Russian Roulette'
        @games[1].start_game
    when 'Slots'
        @games[2].start_game
    when 'Return to Main Menu'
        casino.display_menu
    end

  end


end
