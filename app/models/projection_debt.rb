class ProjectionDebt
	attr_accessor :balance_projection
	attr_accessor :debt	
	attr_accessor :amortizations_count
	attr_accessor :transaction_items

	def initialize debt, start_date = nil
		self.debt = debt
		self.amortizations_count = start_date_to_amortizations_count start_date
		self.transaction_items = build_transaction_items
	end

	def month_report_projection date
		result = []
		
		remaining_amortizations = debt.loan_term - amortizations_count
		exchange_rate = debt.transaction_items.last.exchange_rate
		
		(0..(amortizations_total + debt.charges_grace_period) - (debt.interests.count)).each do |future_transaction_count|

			debt.transaction_infos.sort_by(&:order).reject(&:withdraw?).each_with_index do |transaction_info, index|

				if (future_transaction_count == 0 && index == 0) 
					balance_projection = debt.outstanding_balance
				else 
					balance_projection = result.last.final_outstanding_balance
				end

				value = FormulaService.eval(transaction_info.formula, self)

				result << FutureTransaction.new(debt: debt,
																				projection_debt: self,
																				transaction_info: transaction_info,
																				value: value,
																				value_brl: value * exchange_rate, 
																				date: transaction_info.payment_date + future_transaction_count.months, 
																				start_balance: balance_projection) unless transaction_info.amortization? && remaining_amortizations < future_transaction_count
				
				self.amortizations_count += 1 if transaction_info.amortization?
			end

		end

		result
	end

	def build_transaction_items
		result = []

		remaining_amortizations = debt.loan_term - amortizations_count
		exchange_rate = debt.amortizations[amortizations_count - 1].exchange_rate

		(0..(remaining_amortizations + debt.charges_grace_period) - (debt.interests.count)).each do |future_transaction_count|

			debt.transaction_infos.sort_by(&:order).reject(&:withdraw?).each_with_index do |transaction_info, index|

				if (future_transaction_count == 0 && index == 0) 
					balance_projection = debt.amortizations[amortizations_count - 1].final_outstanding_balance
				else 
					balance_projection = result.last.final_outstanding_balance
				end

				value = FormulaService.eval(transaction_info.formula, self)

				result << FutureTransaction.new(debt: debt,
																				projection_debt: self,
																				transaction_info: transaction_info,
																				value: value,
																				value_brl: value * exchange_rate, 
																				date: transaction_info.payment_date + future_transaction_count.months, 
																				start_balance: balance_projection) unless transaction_info.amortization? && remaining_amortizations < future_transaction_count
				
				self.amortizations_count += 1 if transaction_info.amortization?
			end

		end

		result
	end

	def self.total_by year, category_number, list		
		list.reduce(0){ |sum, transaction| transaction.date.year == year && transaction.transaction_info.category_number == category_number ? sum + transaction.value_brl : sum }
	end

	def projection_period debt, start_date, end_date
		if debt.in_grace_period? 
			amortizations_total = debt.loan_term
		elsif debt.in_amortization_period?
			amortizations_total = X
		else
			amortizations_total = 0
		end
			
		(0..(amortizations_total + debt.charges_grace_period) - (debt.interests.count))
	end

	def start_date_to_amortizations_count start_date		
		start_date.blank? ? debt.amortizations_count : (start_date.year * 12 + start_date.month) - (grace_period.year * 12 + grace_period.month)
	end

	private
		def method_missing(method_name, *args, &block)	    
	    debt.send(method_name)
	  end
end
