class FutureTransaction < TransactionItem		
	def editable?
		false
	end

	def self.list debt
		result = []
		
		(0..debt.loan_term - debt.amortizations.count - 1).each do |i|
			debt.transaction_infos.each do |transaction_info|
				i == 0 ? start_balance = debt.outstanding_balance : start_balance = result[i - 1].final_outstanding_balance
				
				if (transaction_info.category.key = 1) && (debt.in_grace_period?) || transaction_info.category.key = 1
					
					result << FutureTransaction.new(debt: debt,
																					transaction_info: transaction_info, 
																					value: transaction_info.next_amount, 
																					value_brl: nil, 
																					date: debt.payment_date + i.months, 
																					start_balance: start_balance)
				end
			end

		end

		result
	end
		
end