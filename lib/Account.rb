require 'date'
require_relative 'Balance'
require_relative 'Transaction'
require_relative 'Display'

class Account
  attr_reader :balance

  def initialize(balance = Balance, display = Display)
    @balance = balance.new
    @statement = []
    @display = display.new
  end

  def show_balance
    @display.show_balance(@balance)
  end

  def deposit(value, date = Date.today.strftime('%d-%m-%y'))
    return 'value must be a number' unless value.is_a? Numeric

    if value > 0
      @balance.deposit(value)
      @statement.push(Transaction.new(date, format('%.2f', value), '', format('%.2f', @balance.funds)))
    else
      'value must be a number greater than £0.00'
   end
  end

  def withdraw(value, date = Date.today.strftime('%d-%m-%y'))
    return 'value must be a number' unless value.is_a? Numeric

    if value > 0
      @balance.withdraw(value)
      @statement.push(Transaction.new(date, '', format('%.2f', value), format('%.2f', @balance.funds)))
    else
      'value must be a number greater than £0.00'
    end
  end

  def print_statement
    @display.printout(@statement)
  end
end

acc = Account.new
acc.deposit(1000, '10-01-2012')
acc.deposit(2000, '13-01-2012')
acc.withdraw(500, '14-01-2012')
acc.print_statement
acc.show_balance
