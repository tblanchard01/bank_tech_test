class Balance
  attr_reader :funds
  def initialize(funds = 0.00)
    @funds = funds
  end

   def deposit(value)
    @funds += value
  end

  def withdraw(value)
    @funds -= value
  end
end
