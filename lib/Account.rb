require_relative 'balance'

class Account
  attr_reader :balance

  def initialize(balance = Balance)
    @balance = balance.new
 end

  def show_balance
    @balance.show_funds
  end

  def deposit(value)
    @balance.deposit(value)
end

  def withdraw(value)
    @balance.withdraw(value)
  end
end
