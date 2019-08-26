class ProjectionDebt
	attr_accessor :balance_projection
	attr_accessor :debt
	attr_accessor :amortizations_count

	def initialize debt
		self.debt = debt
		self.amortizations_count = debt.amortizations.count
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
