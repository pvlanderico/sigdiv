require 'rails_helper'

describe Debt, type: :model do
  before do  	
  	@debt = create(:cef, charges: [ build(:adm_tax), build(:credit_risk) ])
  	@debts = create_list(:debt, 30)
	end

  it 'is valid' do
  	expect(@debt.valid?).to be true
  end
  # self.search code_query, name_query, creditor_query, signature_year_query, status_query
  context 'when searching' do
  	context 'for a existing code' do
  		it 'returns the correct amount' do  			
  			expect(Debt.search(@debt.code.to_s).count).to eq(1)
  		end
  		it 'returns the correct record' do  			
  			expect(Debt.search(@debt.code.to_s).first.name).to eq('Transoceânica') 
  		end
  	end
  	context 'for a non existing code' do
  		it 'returns nothing' do
  			expect(Debt.search('-1').count).to eq(0)
  		end
  	end
  	context 'for a part of a name present in many debts' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, 'bank').count).to be >(0)
  		end
  	end

		context 'for a part of a name not present in any debt' do
  		it 'returns nothing' do
  			expect(Debt.search(nil, 'SADP').count).to eq(0)
  		end
  	end
  	context 'for debts in a specific year' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, nil, 2012).count).to be >(0)
  		end
  	end
  	context 'a year that has no debts' do
  		it 'returns nothing' do
  			expect(Debt.search(nil, nil, nil, 2000).count).to eq(0)
  		end
  	end
  	context 'for debts with a specific creditor' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, Creditor.first.id).count).to be >(0)
  		end
  	end
  	context 'a creditor that has no debts' do
  		it 'returns nothing' do
  			expect(Debt.search(nil, nil, create(:creditor, name: 'Itaú')).count).to eq(0)
  		end
  	end
  	context 'for debts in grace period' do
  		before do
  			create(:debt, grace_period: Date.tomorrow)
  		end
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, nil, nil, 'Carência').count).to be >(0)
  		end
		end
		context 'for debts in amortization period' do
  		it 'returns the correct amount' do
  			expect(Debt.search(nil, nil, nil, nil, 'Amortização').count).to be >(0)
  		end
		end
		context 'for finished debts' do
  		it 'returns the correct amount'
		end
  end
end
