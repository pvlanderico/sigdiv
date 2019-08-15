class FutureTransaction < TransactionItem

	def editable?
		false
	end

	def self.list debt
		result = []
		
		(0..debt.loan_term - debt.amortizations.count - 1).each do |i|
			i == 0 ? start_balance = debt.outstanding_balance : start_balance = result[i - 1].final_outstanding_balance

			debt.transaction_infos.each do |transaction_info|
				result << FutureTransaction.new(debt: debt,
																				transaction_info: transaction_info,
																				value: FormulaService.eval(transaction_info.formula, debt), 
																				value_brl: nil, 
																				date: transaction_info.payment_date + i.months, 
																				start_balance: start_balance) if transaction_info.category_number == 2 || transaction_info.category_number == 4
			end
		end

		result
	end
		
end