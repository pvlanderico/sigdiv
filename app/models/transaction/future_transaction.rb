class FutureTransaction < TransactionItem
		
	def editable?
		false
	end

	def self.list debt
		result = []
		next_instalment = debt.next_instalment
		(0..debt.loan_term - debt.payments.count - 1).each do |i|
			i == 0 ? start_balance = debt.outstanding_balance : start_balance = result[i - 1].final_outstanding_balance
			result << FutureTransaction.new(debt: debt, value: next_instalment, value_brl: next_instalment, date: debt.payment_date + i.months, start_balance: start_balance)
		end

		result
	end
		
end