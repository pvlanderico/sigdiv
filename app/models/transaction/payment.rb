class Payment < Transaction
	before_save :set_interest
	before_save :set_principal

	validates :principal, presence: true

	def final_outstanding_balance
		start_outstanding_balance - principal
	end

	private
		def set_interest
			self.interest = debt.interest
		end

		def set_principal
			self.principal = debt.next_instalment - debt.interest
		end
end