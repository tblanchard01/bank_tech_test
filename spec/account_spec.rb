require 'Account'

describe Account do
  let(:account) { described_class.new }
  it 'new accounts can be created (using Account.new)' do
    expect(account).to be_instance_of Account
  end

  it 'has a default balance of 0.' do
    expect(account.balance).to eq 0.00
  end



it 'can be deposited into' do 
  expect { account.deposit(10) }.to change { account.balance }.by(10)
end 

it 'can be withdrawn from' do

  expect { account.withdraw(10) }.to change { account.balance }.by(-10)
end 
end