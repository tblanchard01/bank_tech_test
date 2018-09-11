class Balance
  attr_reader :funds
  def initialize(funds = 0.00)
    @funds = funds
  end

  def show_funds
    formatted_funds = format('£%.2f', @funds)
  end

  def deposit(value)
    @funds += value
  end

  def withdraw(value)
    @funds -= value
  end
end
