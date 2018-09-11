require 'Account'

describe Account do
  let(:account) { described_class.new }
  it 'new accounts can be created' do
    expect(account).to be_instance_of Account
  end

  it 'has a default balance of £0.00' do
    expect(account.show_balance).to eq '£0.00'
  end

  it 'can be deposited into' do
    expect { account.deposit(10) }.to change { account.balance.funds }.by(10)
  end

  it 'can be withdrawn from' do
    expect { account.withdraw(10) }.to change { account.balance.funds }.by(-10)
  end
  it 'user cannot deposit £0.00' do
    expect(account.deposit(0)).to eq('value must be greater than £0.00')
  end
  it 'user cannot withdraw £0.00' do
    expect(account.withdraw(0)).to eq('value must be greater than £0.00')
  end

  it 'user cannot deposit negative values' do
    expect(account.deposit(-4)).to eq('value must be greater than £0.00')
    expect(account.balance.funds).to eq(0)
  end
  it 'user cannot withdraw negative values' do
    account.deposit(10)
    expect(account.withdraw(-4)).to eq('value must be greater than £0.00')
    expect(account.balance.funds).to eq(10)
  end

  it 'calculates balance of multiple transactions correctly' do 
    account.deposit(10.50)
    account.deposit(50.25)
    account.withdraw(30.25)
    expect(account.balance.funds).to eq(30.50)
    expect(account.show_balance).to eq '£30.50'
  end 
end

