
require_relative 'player'

class People

  attr_reader :players
  def initialize
    @players = []
    @players << Player.new(Wallet.new)
  end


  def return_all_player
    @players
  end


end
