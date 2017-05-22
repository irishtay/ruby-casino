
class Wallet

  def initialize
    @balance = 0
  end

  def add_money(num)
   @balance += num
  end

  def remove_balance
    @balance -= num
  end

  def get_balance
    @balance
  end

end
