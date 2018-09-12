require 'Account'

describe Account do
  let(:account) { described_class.new }
 
  it 'has a default balance of £0.00' do
    expect(account.show_balance).to eq '£0.00'
  end
  describe 'despositing and withdrawal tests' do
    it 'can be deposited into' do
      expect { account.deposit(10) }.to change { account.balance.funds }.by(10)
    end

    it 'can be withdrawn from' do
      expect { account.withdraw(10) }.to change { account.balance.funds }.by(-10)
    end

    describe 'error handling' do 

      it 'user can not deposit non-numeric values' do 
        expect(account.deposit("a string")).to eq('value must be a number')
      end 

      it 'user can not withdraw non-numeric values' do 
        account.deposit(10)
        expect(account.withdraw("a string")).to eq('value must be a number')
      end 


    it 'user cannot deposit £0.00' do
      expect(account.deposit(0)).to eq('value must be a number greater than £0.00')
    end
    it 'user cannot withdraw £0.00' do
      expect(account.withdraw(0)).to eq('value must be a number greater than £0.00')
    end



    it 'user cannot deposit negative values' do
      expect(account.deposit(-4)).to eq('value must be a number greater than £0.00')
      expect(account.balance.funds).to eq(0)
    end
    it 'user cannot withdraw negative values' do
      account.deposit(10)
      expect(account.withdraw(-4)).to eq('value must be a number greater than £0.00')
      expect(account.balance.funds).to eq(10)
    end
  end 

    it 'calculates balance of multiple transactions correctly' do
      account.deposit(10.50)
      account.deposit(50.25)
      account.withdraw(30.25)
      expect(account.balance.funds).to eq(30.50)
      expect(account.show_balance).to eq '£30.50'
    end
  end
  # describe 'statement tests' do
  #   it 'creating deposit causes object to be added to statment array.' do
  #     expect(account.statement.length).to eq(0)
  #     account.deposit(10)
  #     expect(account.statement.length).to eq(1)
  #   end
  #   it 'creating withdrawal causes object to be added to statment array.' do
  #     expect(account.statement.length).to eq(0)
  #     account.withdraw(10)
  #     expect(account.statement.length).to eq(1)
  #   end
  #   it 'deposit object is created with the correct properties' do
  #     account.deposit(10)
  #     expect(account.statement[0].date).to eq(Date.today.strftime("%d-%m-%y"))
  #     expect(account.statement[0].credit).to eq('10.00')
  #     expect(account.statement[0].debit).to eq('')
  #     expect(account.statement[0].balance).to eq('10.00')
  #   end
  #   it 'withdraw object is created with the correct properties' do
  #     account.deposit(20)
  #     account.withdraw(10)
  #     expect(account.statement[1].date).to eq(Date.today.strftime("%d-%m-%y"))
  #     expect(account.statement[1].credit).to eq('')
  #     expect(account.statement[1].debit).to eq('10.00')
  #     expect(account.statement[1].balance).to eq('10.00')
  #   end
  # end
end
