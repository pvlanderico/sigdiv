class Payment < Transaction
	has_many :payment_charges

	accepts_nested_attributes_for :payment_charges, reject_if: :all_blank

	validates :principal, presence: true

	def final_outstanding_balance
		start_outstanding_balance - principal
	end

	def init
		set_interest
		set_principal
		set_payment_charges
	end

	private
		def set_interest
			self.interest = Decimal.new(debt.interest.to_f).round(5)
		end

		def set_principal			
			self.principal = Decimal.new(debt.next_instalment - debt.interest).round(5)
		end

		def set_payment_charges
			self.debt.charges.each do |charge|
				payment_charge = PaymentCharge.new charge: charge, value: Decimal.new(charge.value.to_f).round(5)
				self.payment_charges << payment_charge
			end
		end
end