require 'Account'

describe Account do
  let(:account) { described_class.new }
  it '  new accounts can be created (using Account.new)' do 
  expect(account).to be_instance_of Account
  end 


it 'checks that a new oyster has a balance of 0' do
  expect(account.balance).to eq 0
  end
end 