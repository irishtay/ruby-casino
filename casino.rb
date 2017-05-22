require 'pry'
require 'colorize'

require_relative 'people'
require_relative 'gaming_options'

class Casino
  attr_accessor :people, :gaming_options

  def initialize
    puts 'Welcome to our Casino'
    @people = People.new
    @gaming_options = Gaming_options.new
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
        gaming_options.display_menu_of_games
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
