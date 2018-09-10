require_relative 'balance'

class Account
  def initialize(balance = Balance)
    @balance = balance.new
 end

  def balance
    @balance.show_funds 
  end

  def deposit 
  end 


end 
#  test this 
