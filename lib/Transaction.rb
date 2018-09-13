class Transaction
  attr_accessor :date, :credit, :debit, :balance
  def initialize(date = Date.today.strftime('%d-%m-%y'), credit, debit, balance)
    @date = date
    credit == '' ? (@credit = credit) : @credit = format('%.2f', credit)
    debit == '' ? (@debit = debit) : @debit = format('%.2f', debit)

    @balance = format('%.2f', balance)
end
end
