require 'rails_helper'

RSpec.describe FormulaService, type: :model do
 	describe '.eval' do
 		before do
 			@debt = create :debt
 		end

 		it 'evaluates a simple formula correctly' do
 			expect(FormulaService::eval('2 + 2', @debt)).to eq 4
 		end

 		it 'evaluates a variable' do
 			expect(FormulaService::eval('JUROS', @debt)).to eq @debt.interest_rate
 		end
 	end

end