class Payment < Transaction
	before_save :set_interest

	def final_outstanding_balance
		start_outstanding_balance - value
	end

	private
		def set_interest
			interest = debt.interest
		end
end