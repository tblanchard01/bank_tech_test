require 'Account'

describe Account do
  let(:account) { described_class.new }
  it 'new accounts can be created' do
    expect(account).to be_instance_of Account
  end

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
  describe 'statement tests' do
    it 'creating deposit causes object to be added to statment array.' do
      expect(account.statement.length).to eq(0)
      account.deposit(10)
      expect(account.statement.length).to eq(1)
    end
    it 'creating withdrawal causes object to be added to statment array.' do
      expect(account.statement.length).to eq(0)
      account.withdraw(10)
      expect(account.statement.length).to eq(1)
    end
    it 'deposit object is created with the correct properties' do
      account.deposit(10)
      expect(account.statement[0].date).to eq('14/01/2012')
      expect(account.statement[0].credit).to eq('10.00')
      expect(account.statement[0].debit).to eq('')
      expect(account.statement[0].balance).to eq('10.00')
    end
    it 'withdraw object is created with the correct properties' do
      account.deposit(20)
      account.withdraw(10)
      expect(account.statement[1].date).to eq('14/01/2012')
      expect(account.statement[1].credit).to eq('')
      expect(account.statement[1].debit).to eq('10.00')
      expect(account.statement[1].balance).to eq('10.00')
    end
     it 'prints sample statement correctly as per instructions' do
      account.deposit(1000, '10-01-2012')
      account.deposit(2000, '13-01-2012')
      account.withdraw(500, '14-01-2012')
      expect{account.print_statement}.to output("date || credit (£) || debit (£) || balance (£)
===============================================
14-01-2012 ||  || 500.00 || 2500.00
13-01-2012 || 2000.00 ||  || 3000.00
10-01-2012 || 1000.00 ||  || 1000.00").to_stdout 
     end
  end
end
