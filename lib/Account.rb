require 'date'
require_relative 'balance'
require_relative 'Transaction'

class Account
  attr_reader :balance
  attr_reader :statement

  def initialize(balance = Balance)
    @balance = balance.new
    @statement = []
  end

  def show_balance
    @balance.show_funds
  end

  def deposit(value, date = "14/01/2012")
    if value > 0
      @balance.deposit(value)
      @statement.push(Transaction.new(date, value, '', @balance.funds))
    else
      'value must be greater than £0.00'
  end
  end

  def withdraw(value, date = "14/01/2012")
    if value > 0
      @balance.withdraw(value)
      @statement.push(Transaction.new(date, '', value, @balance.funds))
    else
      'value must be greater than £0.00'
    end
  end
  def print_statement 



  end 
end
