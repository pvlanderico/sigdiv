class ProjectionDebt
	attr_accessor :balance_projection
	attr_accessor :debt	
	attr_accessor :amortizations_count

	def initialize debt, start_date, end_date
		self.debt = debt
		self.amortizations_count = amortizations_count
		self.loan_term = amortizations_total
		self.transaction_items = build_transaction_items start_date, end_date
	end

	def build_transaction_items start_date, end_date
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
				
				amortizations_count += 1 if transaction_info.amortization?
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
	
  # Desembolsos
	def withdraws
		#transaction_items.where(transaction_infos: { category_number: 1 }) 
	end
    
  # Juros
	def interests
		#transaction_items.where(transaction_infos: { category_number: 2 })
	end

	def charges_grace_period
    # date_withdraw = transaction_items.where(transaction_infos: { category_number: 1 }).order("date").first.date

    # (grace_period.year * 12 + grace_period.month) - (date_withdraw.year * 12 + date_withdraw.month)
  end

  # Próxima parcela
	def next_instalment
		balance_projection * instalment_formula_numerator / instalment_formula_denominator
	end	
    
  ['next_instalment', 'amortization', 'interest', 'outstanding_balance'].each do |method_name|
  	define_method :"show_#{method_name}" do 
  		Decimal.new(self.send(method_name).to_f)
  	end
  end

	# Juros
	def interest interest_rate = self.interest_rate
		withdraws_total = 0
		withdraws.where(date: reference_period).each do |withdraw|
			withdraws_total += withdraw.value * interest_rate / 360 * (payment_date - (withdraw.date - 1.day)).to_i
		end

		(30 * outstanding_balance * interest_rate / 360 ) - withdraws_total
	end

	# Saldo devedor
	def outstanding_balance final_date = Date.today
		balance_projection
	end

	def withdraws_pro_rata
		result = []
		withdraws.where(date: reference_period).each do |withdraw|
			result += result + [withdraw.value * withdraw.period]
		end
	end

	private

		def self.date_range_from_year year
			Date.new(year)..(Date.new(year + 1) - 1.day)
		end

		def instalment_formula_numerator
			( ( (1 + interest_rate_per_month) ** (loan_term - amortizations_count) ) * interest_rate_per_month )
		end

		def instalment_formula_denominator
			( ( ( 1 + interest_rate_per_month ) ** (loan_term - amortizations_count) ) - 1 )
		end

		def method_missing(method_name, *args, &block)	    
	    debt.send(method_name)
	  end
end
