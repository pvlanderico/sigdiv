class Charge < ApplicationRecord
	belongs_to :debt
	
	validates :name, presence: true

	def total
		Dentaku(eval_formula)
	end

	private

	def eval_formula
		formula.gsub!('BASE', base.to_s).gsub!('SALDO', debt.contract_value.to_s)
	end
	
end
