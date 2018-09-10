require 'Account'

describe Account do
  let(:account) { described_class.new }
  it 'new accounts can be created' do
    expect(account).to be_instance_of Account
  end

  it 'has a default balance of £0.00' do
    expect(account.show_balance).to eq "£0.00"
  end



it 'can be deposited into' do 
  expect { account.deposit(10) }.to change { account.balance.funds }.by(10)
end 

it 'can be withdrawn from' do

  expect { account.withdraw(10) }.to change { account.balance.funds }.by(-10)
end 
end