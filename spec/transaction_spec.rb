require 'Transaction'
describe Transaction do
    let(:transaction) { described_class.new("11/09/2018",50,'',100) }
    it 'new accounts can be created' do
      expect(transaction).to be_instance_of Transaction
    end
end 