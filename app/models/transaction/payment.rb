class Payment < Transaction
	before_save :set_interest

	def amortization
		if debt.category == 'PRICE'
			value - interest
		else
			# TODO
		end
	end

	private
		def set_interest
			interest = debt.interest
		end
end