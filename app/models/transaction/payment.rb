class Payment < Transaction
	has_many :payment_charges

	before_save :set_interest
	before_save :set_principal
	before_save :set_payment_charges

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

		def set_payment_charges
			self.debt.charges.each do |charge|
				payment_charge = PaymentCharge.new charge: charge, value: charge.value
				self.payment_charges << payment_charge
			end
		end
end