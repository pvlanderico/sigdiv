class Charge < ApplicationRecord
	belongs_to :debt
	has_many :payment_charges
	
	validates :name, presence: true

	def total
		Dentaku(eval_formula)
	end

	def value
		if Withdraw.count == 0
			0
		elsif count_days
			full_month_value - (Withdraw.last.value * ((debt.payment_date) - (Withdraw.last.date - 1.day)).to_i  * (base / 360) / 100)
		else
			full_month_value
		end
	end

	private

	def full_month_value
		debt.outstanding_balance * (base / 360) * 30 / 100
	end

	def eval_formula
		formula.gsub!('BASE', base.to_s).gsub!('SALDO', debt.contract_value.to_s)
	end
	
end
