class Withdraw < Transaction
	validates :value, presence: true
	#validates :value_brl, presence: true
	
	def final_outstanding_balance
		start_outstanding_balance + value
	end

	def editable?
		date > debt.payments.last.date
	end
end