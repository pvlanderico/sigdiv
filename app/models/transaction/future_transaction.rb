class FutureTransaction < TransactionItem
	attr_accessor :projection_debt

	def editable?
		false
	end

	def self.list debt		
		result = []
		projection_debt = ProjectionDebt.new(debt)
		remaining_amortizations = debt.loan_term - debt.amortizations.count
		exchange_rate = debt.transaction_items.last.exchange_rate
		
		(0..(debt.loan_term + debt.charges_grace_period) - (debt.interests.count)).each do |future_transaction_count|

			debt.transaction_infos.sort_by(&:order).reject(&:withdraw?).each_with_index do |transaction_info, index|

				if (future_transaction_count == 0 && index == 0) 
					projection_debt.balance_projection = debt.outstanding_balance
				else 
					projection_debt.balance_projection = result.last.final_outstanding_balance
				end

				value = FormulaService.eval(transaction_info.formula, projection_debt)

				
				result << FutureTransaction.new(debt: debt,
																				projection_debt: projection_debt,
																				transaction_info: transaction_info,
																				value: value,
																				value_brl: value * exchange_rate, 
																				date: transaction_info.payment_date + future_transaction_count.months, 
																				start_balance: projection_debt.balance_projection) unless transaction_info.amortization? && remaining_amortizations < future_transaction_count
				
				projection_debt.amortizations_count += 1 if transaction_info.amortization?
			end

		end

		result
	end

	def self.total_by year, category_number, list		
		list.reduce(0){ |sum, transaction| transaction.date.year == year && transaction.transaction_info.category_number == category_number ? sum + transaction.value_brl : sum }
	end
		
end