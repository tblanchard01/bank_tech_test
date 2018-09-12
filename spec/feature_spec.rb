require 'Account'

describe 'Features' do
  it 'User can create account, with a balance of £0.00' do
    account = Account.new
    expect(account.show_balance).to eq('£0.00')
  end

  it 'user can deposit money into account' do
    account = Account.new
    account.deposit(10.42)
    expect(account.show_balance).to eq('£10.42')
  end
  it 'user can deposit money into account' do
    account = Account.new
    account.deposit(10.42)
    account.withdraw(5.02)
    expect(account.show_balance).to eq('£5.40')
  end
  

    it 'prints sample statement correctly as per instructions' do
          account = Account.new
          account.deposit()

        expect{display.printout(statement)}.to output("date || credit (£) || debit (£) || balance (£) \n===============================================\n10-01-12 || 20.0 ||  || 50.0\n10-01-12 || 10.0 ||  || 30.0\n").to_stdout 
     end

end
