require 'Display'
describe Display do
  let(:display) { described_class.new }
  let(:statement) { [Transaction.new(10.00, '', 30.00), Transaction.new(20.00, '', 50.00)] }
  it 'shows user their current balance on request' do
    expect(display.show_balance(statement)).to eq('£50.00')
  end

    it 'prints sample statement correctly as per instructions' do
    
        expect{display.printout(statement)}.to output("date || credit (£) || debit (£) || balance (£) \n===============================================\n12-09-18 || 20.0 ||  || 50.0\n12-09-18 || 10.0 ||  || 30.0\n").to_stdout 
     end

end

