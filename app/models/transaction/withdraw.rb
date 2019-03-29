class Withdraw < Transaction
	validates :value, presence: true
	validates :value_brl, presence: true
	
	def final_outstanding_balance
		start_outstanding_balance + value
	end
end