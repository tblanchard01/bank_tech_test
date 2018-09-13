require 'Balance'

describe Balance do
  let(:balance) { described_class.new }

  it 'has funds of of 0 on creation' do
    expect(balance.funds).to eq 0.0
  end

  it 'can be deposited into' do
    expect { balance.deposit(10) }.to change { balance.funds }.by(10)
  end

  it 'can be withdrawn from' do
    expect { balance.withdraw(10) }.to change { balance.funds }.by(-10)
  end
end
