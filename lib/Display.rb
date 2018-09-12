class Display
  def initialize(statement)
    @statement = statement
  end

  def printout
    puts 'date' + ' || ' + 'credit (£)' + ' || ' + 'debit (£)' + ' || ' + 'balance (£) '
    puts '==============================================='
    @statement.reverse_each { |row| puts row.date.to_s + ' || ' + row.credit.to_s + ' || ' + row.debit.to_s + ' || ' + row.balance.to_s }
  end
end
