require 'rails_helper'

describe Debt, type: :model do
  before(:each) do  	
  	@debt = create(:cef, charges: [ build(:adm_tax), build(:credit_risk) ])
    
    create(:withdraw_0515, debt: @debt)
    create(:withdraw_0615, debt: @debt)
    create(:withdraw_0715, debt: @debt)
    create(:withdraw_0815, debt: @debt)
    create(:withdraw_0915, debt: @debt)
    create(:withdraw_1015, debt: @debt)
    create(:withdraw_1115, debt: @debt)
    create(:withdraw_1215, debt: @debt)
    create(:withdraw_0316, debt: @debt)
    create(:withdraw_0516, debt: @debt)
    create(:withdraw_0616, debt: @debt)
    create(:withdraw_0716, debt: @debt)
    create(:withdraw_0816, debt: @debt)
    create(:withdraw_0916, debt: @debt)
    create(:withdraw_1016, debt: @debt)
    create(:withdraw_1116, debt: @debt)
    create(:withdraw_1216, debt: @debt)
    create(:withdraw_0117, debt: @debt)
    create(:withdraw_0217, debt: @debt)
    create(:withdraw_0317, debt: @debt)
    create(:withdraw_0617, debt: @debt)
    create(:withdraw_0917, debt: @debt)
    create(:withdraw_1117, debt: @debt)        
    create(:payment_1217, debt: @debt)
    create(:payment_0118, debt: @debt)
    create(:withdraw_0218, debt: @debt)    
    create(:payment_0218, debt: @debt)
    create(:payment_0318, debt: @debt)
    create(:payment_0418, debt: @debt)
    create(:payment_0518, debt: @debt)
    create(:payment_0618, debt: @debt)
    create(:payment_0718, debt: @debt)
    create(:payment_0818, debt: @debt)
    create(:payment_0918, debt: @debt)
    create(:payment_1018, debt: @debt)
    create(:withdraw_1018, debt: @debt)
    create(:payment_1118, debt: @debt)
    create(:payment_1218, debt: @debt)

  	@debts = create_list(:debt, 30)
	end

  it 'is valid' do
  	expect(@debt.valid?).to be true
  end

  describe '#reference_period' do
    context 'when last month has 28 days' do
      it 'period is correct' do
        expect(@debt.send(:reference_period, Date.new(2019, 3, 1)).count).to eq 28
      end
    end

    context 'when last month has 29 days' do
      it 'period is correct' do
        expect(@debt.send(:reference_period, Date.new(2020, 3, 1)).count).to eq 29
      end
    end

    context 'when last month has 30 days' do
      it 'period is correct' do
        expect(@debt.send(:reference_period, Date.new(2019, 5, 1)).count).to eq 30
      end
    end

    context 'when last month has 31 days' do
      it 'period is correct' do
        expect(@debt.send(:reference_period, Date.new(2019, 6, 1)).count).to eq 31
      end
    end
  end

  describe '#next_instalment' do
    it 'next instalment value is correct' do
      expect(@debt.show_next_instalment).to eq(Decimal.new(96084.77312037640))
    end
  end

  describe '#amortization' do
  	it 'amortization value is correct' do
  		expect(@debt.show_amortization).to eq(Decimal.new(30971.2369092638))
  	end
  end

  describe '#interest' do
  	it 'interest value is correct' do
			expect(@debt.show_interest).to eq(Decimal.new(65113.5362111126))
  	end  
  end
  
  describe '#outstanding_balance' do 
    it 'Returns the correct value' do
      expect(@debt.show_outstanding_balance).to eq(Decimal.new(13022707.24222250))
    end
  end
   
  describe '#charges_total' do
  	it 'charges sum is correct'
  end

  describe '#status' do
  	context 'when debt is in grace period' do
  		before do 
  			@debt_in_grace_period = create(:debt, grace_period: Date.tomorrow)
  		end
  		it 'is not in amortization period' do
  			expect(@debt_in_grace_period.in_amortization_period?).to be false
  		end
  		it 'is not finished' do
  			expect(@debt_in_grace_period.finished?).to be false
  		end
  		it 'status returns grace period' do
  			expect(@debt_in_grace_period.status).to eq('Carência')
  		end
  	end

  	context 'when debt is in amortization period' do
  		it 'is not in grace period' do
  			expect(@debt.in_grace_period?).to be false
  		end
  		it 'is not finished' do
  			expect(@debt.finished?).to be false
  		end
  		it 'status returns amortization period' do
  			expect(@debt.status).to eq('Amortização')
  		end
  	end

    context 'when there is 2 charges' do
      it 'first charge value is correct' do
        expect(@debt.payment_charges.first.value).to eq('21704.51207')
      end

      it 'second charge value is correct' do
        expect(@debt.payment_charges.last.value).to eq('7596.57922')
      end
    end

  	context 'when debt is finished' do
  		# it 'is not in grace period' do
  		# 	expect(@debt.in_grace_period?).to be false
  		# end
  		# it 'is not is amortization period' do
  		# 	expect(@debt_in_grace_period.in_amortization_period?).to be false
  		# end
  		# it 'status returns finished' do
  		# 	expect(@debt.status).to eq('Finalizado')
  		# end
  	end
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
