class FuturePayment < Transaction
	has_many :payment_charges
	attr_accessor :debt, :principal

	def final_outstanding_balance
		start_outstanding_balance - principal
	end

	def editable?
		false
	end

	def self.list debt
		result = []
		next_instalment = debt.next_instalment
		(0..debt.loan_term - debt.payments.count - 1).each do |i|
			i == 0 ? start_outstanding_balance = debt.outstanding_balance : start_outstanding_balance = result[i - 1].final_outstanding_balance
			result << FuturePayment.new(debt: debt, principal: next_instalment, date: debt.payment_date + i.months, start_outstanding_balance: start_outstanding_balance)
		end

		result
	end
		
end