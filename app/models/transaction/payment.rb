class Payment < Transaction
	has_many :payment_charges

	before_validation :set_interest, if: :new_record?
	before_validation :set_principal, if: :new_record?
	before_validation :set_payment_charges, if: :new_record?

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