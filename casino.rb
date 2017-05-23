require 'pry'
require 'tty-prompt'
require 'colorize'

require_relative 'people'
require_relative 'gaming_options'
require_relative 'giftshop'
require_relative 'bar'

class Casino
  attr_accessor :people, :gaming_options, :giftshop, :bar

  def initialize
    puts `clear`
    puts 'Welcome to our Casino'
    @people = People.new
    @gaming_options = Gaming_options.new(people.players[0], self)
    @giftshop = Giftshop.new(self, people.players[0])
    @bar = Bar.new(self, people.players[0])
    display_menu
  end

  def display_menu

    prompt = TTY::Prompt.new

    menu_selection = prompt.select("What would you like to do?", ["Begin a Game", "Go to the Bar", "Visit Gift Shop", "Exit Casino"])

    

    case menu_selection
      when 'Begin a Game'
        gaming_options.display_menu_of_games
      when "Go to the Bar"
        bar.purchase_drink
      when "Visit Gift Shop", "Exit Casino"
        giftshop.display_menu
    end

  end

end

casino = Casino.new
