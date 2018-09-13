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
  it 'user can withdraw money from account' do
    account = Account.new
    account.deposit(10.42)
    account.withdraw(5.02)
    expect(account.show_balance).to eq('£5.40')
  end

  it 'prints sample statement correctly as per instructions' do
    allow(Date).to receive(:today).and_return Date.new(2012, 0o1, 12)
    account = Account.new
    account.deposit(50)
    account.withdraw(30)
    expect { account.print_statement }.to output("date || credit (£) || debit (£) || balance (£) \n===============================================\n12-01-12 ||  || 30.00 || 20.00\n12-01-12 || 50.00 ||  || 50.00\n").to_stdout
  end
end
