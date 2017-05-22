require 'pry'
require 'colorize'

require_relative 'player'

class Casino
  attr_accessor :people, :games

  def initialize
    puts 'Welcome to our Casino'
    # @people = people.new
    # @games = games.new
    display_menu
  end

  def display_menu
    puts '1) Begin a Game'
    puts '2) Order Food and Drink'
    puts '3) Visit Gift Shop'
    puts '4) Exit Casino'

    menu_selection = gets.to_i

    case menu_selection
      when 1
        # Create Game
      when 2
        # Buy Food or Drink
      when 3 || 4
        # Visit Gift Shop
    end

  end


    def casino_menu

    end
end

casino = Casino.new
