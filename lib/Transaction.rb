class Transaction
  attr_accessor :date, :credit, :debit, :balance
  def initialize(date = Date.today.strftime('%d-%m-%y'), credit, debit, balance)
    @date = date
    @credit = credit
    @debit = debit
    @balance = balance
end
end
