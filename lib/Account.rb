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
    value > 0 ? @balance.deposit(value) : 'value must be greater than £0.00'
end

  def withdraw(value)
    value > 0 ? @balance.withdraw(value) : 'value must be greater than £0.00'
  end
end
