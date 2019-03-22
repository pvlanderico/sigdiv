class Payment < Transaction
	# before_save :set_interest
	# before_save :set_principal

	validates :principal, presence: true

	def final_outstanding_balance
		start_outstanding_balance - value
	end

	private
		def set_interest
			interest = debt.interest
		end

		def set_principal
			principal = debt.next_installment - interest
		end
end