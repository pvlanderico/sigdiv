class FutureTransaction < TransactionItem		
	def editable?
		false
	end

	def self.list debt
		result = []
		
		(0..debt.loan_term - debt.amortizations.count - 1).each do |i|
			i == 0 ? start_balance = debt.outstanding_balance : start_balance = result[i - 1].final_outstanding_balance
									
			result << FutureTransaction.new(debt: debt,
																			transaction_info: debt.transaction_infos.find_by(category_number: 2), 
																			value: debt.interest_amount, 
																			value_brl: nil, 
																			date: debt.transaction_infos.find_by(category_number: 2).payment_date + i.months, 
																			start_balance: start_balance)
			
		end

		result
	end
		
end