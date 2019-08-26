class FutureTransaction < TransactionItem
	attr_accessor :projection_debt

	def editable?
		false
	end

	def self.list debt
		result = []
		projection_debt = ProjectionDebt.new(debt)
		remaining_amortizations = debt.loan_term - debt.amortizations.count

		(0..(debt.loan_term + debt.charges_grace_period) - (debt.interests.count)).each do |future_transaction_count|

			debt.transaction_infos.reject(&:withdraw?).each_with_index do |transaction_info, index|

				future_transaction_count == 0 && index == 0 ? projection_debt.balance_projection = debt.outstanding_balance : projection_debt.balance_projection = result[future_transaction_count - 1].final_outstanding_balance

				result << FutureTransaction.new(debt: debt,
																				projection_debt: projection_debt,
																				transaction_info: transaction_info,
																				value: FormulaService.eval(transaction_info.formula, projection_debt),
																				value_brl: nil, 
																				date: transaction_info.payment_date + future_transaction_count.months, 
																				start_balance: projection_debt.balance_projection) unless transaction_info.category_number == 3 && remaining_amortizations < future_transaction_count
				
				projection_debt.amortizations_count += 1 if transaction_info.category_number == 3
			end

		end

		result
	end
		
end