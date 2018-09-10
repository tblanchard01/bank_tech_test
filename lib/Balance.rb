class Balance
    attr_accessor :funds 
    def initialize (funds = 0.00)
        @funds = funds 
    end 

    def show_funds 
        "£%.2f" % @funds
    end

    def deposit(value)
        @funds += value 
    end 

    def withdraw(value)
    @funds -= value
    end 
end 