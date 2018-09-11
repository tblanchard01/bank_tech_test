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

  def deposit(value, date = '14/01/2012')
    if value > 0
      @balance.deposit(value)
      @statement.push(Transaction.new(date, format('%.2f', value), '', format('%.2f', @balance.funds)))
    else
      'value must be greater than £0.00'
  end
  end

  def withdraw(value, date = '14/01/2012')
    if value > 0
      @balance.withdraw(value)
      @statement.push(Transaction.new(date, '', format('%.2f', value), format('%.2f', @balance.funds)))
    else
      'value must be greater than £0.00'
    end
  end

  def print_statement
    puts 'date' + ' || ' + 'credit (£)' + ' || ' + 'debit (£)' + ' || ' + 'balance (£) '
    puts '==============================================='
    @statement.reverse_each { |row| puts row.date.to_s + ' || ' + row.credit.to_s + ' || ' + row.debit.to_s + ' || ' + row.balance.to_s }
  end
end

acc = Account.new
acc.deposit(1000, '10-01-2012')
acc.deposit(2000, '13-01-2012')
acc.withdraw(500, '14-01-2012')
acc.print_statement
