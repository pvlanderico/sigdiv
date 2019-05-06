require "rails_helper"

RSpec.describe TransactionsHelper, :type => :helper do
  describe "#order_by_year" do
  	before do    
	  	create_list(:transaction_2019, 12)
	    create(:transaction_2019, date: Date.new(2019,12,31))
	    create(:transaction_2018)
	    FactoryBot.rewind_sequences
	  end

    it "returns the ordered keys array" do      
    	expect(helper.order_by_year(Transaction.all).keys).to eq([2018, 2019])
    end

    it 'has the correct month keys' do
      expect(helper.order_by_year(Transaction.all)[2019].keys).to eq((1..12).to_a)
    end

    it 'has the correct number of elements' do
      expect(helper.order_by_year(Transaction.all)[2019][12].count).to eq(2)
    end
  end
end