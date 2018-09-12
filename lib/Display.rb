class Display
  def printout(statement)
    puts 'date' + ' || ' + 'credit (£)' + ' || ' + 'debit (£)' + ' || ' + 'balance (£) '
    puts '==============================================='
    statement.reverse_each { |row| puts row.date.to_s + ' || ' + row.credit.to_s + ' || ' + row.debit.to_s + ' || ' + row.balance.to_s }
  end

  def show_balance(statement)
    "£#{format('%.2f',statement.last.balance)}"
      end
end

