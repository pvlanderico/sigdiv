require 'rails_helper'

RSpec.describe FormulaService, type: :model do
 	describe '.eval' do
 		before do
 			@debt = create :debt
 		end

 		it 'evaluates a simple formula correctly' do
 			expect(FormulaService::eval('1 + 3', @debt)).to eq 4
 		end

 		it 'evaluates a variable' do
 			expect(FormulaService::eval('[JUROS]', @debt)).to eq @debt.interest_rate
 		end

 		it 'evaluates a formula containing the same variable 2 times' do
 			expect(FormulaService::eval('[JUROS] + [JUROS]', @debt)).to eq @debt.interest_rate * 2
 		end

 		it 'evaluates a formula containing different variables' do
 			expect(FormulaService::eval('[JUROS] * [PARCELAS]', @debt)).to eq @debt.interest_rate * @debt.loan_term 
 		end

 		it 'evaluates a formula containing constants and variables' do
 			expect(FormulaService::eval('(5 + [JUROS] / 2) * [PARCELAS] + 1', @debt)).to eq (5 + @debt.interest_rate / 2) * @debt.loan_term + 1
 		end
 	end

end