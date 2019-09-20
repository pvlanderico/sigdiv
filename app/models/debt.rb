class Debt < ApplicationRecord
	belongs_to :creditor
	belongs_to :financial_agent, class_name: 'Creditor', optional: true
	belongs_to :currency

	has_many :attachments
	has_many :transaction_infos
	has_many :transaction_items, through: :transaction_infos, source: :items
	
	accepts_nested_attributes_for :transaction_infos, allow_destroy: true

	enum category: [:interno, :externo]
	enum amortization_type: [:sac, :price, :single]
	enum legislation_level: [:federal, :estadual, :municipal]
	
	validates :code, presence: true, numericality: { only_integer: true }, length: { is: 6 }
	validates :contract_value, presence: true
	validates :signature_date, presence: true
	validates :amortization_period, presence: true
	validates :currency, presence: true
	validates :loan_term, presence: true

	def self.search code_query = '', name_query = '', creditor_query = '', signature_year_query = '', status_query = ''
		result = Debt.all

		if code_query.present? 
			return Debt.where(code: code_query)
		elsif creditor_query.present?
			result = result.where(creditor_id: creditor_query)
		end

		result = result.where("name ILIKE ?", "%#{name_query}%") if name_query.present?
		result = result.where(signature_date: date_range_from_year(signature_year_query.to_i)) if signature_year_query.present?

		result = result.select{ |debt| debt.status == status_query } if status_query.present?

		result
	end

	def init
		TransactionInfo::BASIC_TYPES.keys.each do |category_number|
	    transaction_infos << TransactionInfo.new( category_number: category_number )
	   end
	end
	
  # Desembolsos
	def withdraws
		transaction_items.where(transaction_infos: { category_number: 1 }) 
	end

	# Amortizações
	def amortizations
		transaction_items.where(transaction_infos: { category_number: 3 })
	end 
    
  # Juros
	def interests
		transaction_items.where(transaction_infos: { category_number: 2 })
	end

	def charges_grace_period
    date_withdraw = transaction_items.where(transaction_infos: { category_number: 1 }).order("date").first.date

    (grace_period.year * 12 + grace_period.month) - (date_withdraw.year * 12 + date_withdraw.month)
  end

  # Próxima parcela
	def next_instalment
		outstanding_balance * instalment_formula_numerator / instalment_formula_denominator
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

	def contract_value_brl
		contract_value / currency.to_brl	
	end

	def status
		if in_grace_period?
			return 'Carência'
		elsif in_amortization_period?
			return 'Amortização'
		elsif finished?
			return 'Finalizada'
		end
	end

	def in_grace_period?
		grace_period > Date.today && !finished?
	end

	def in_amortization_period?
		grace_period < Date.today && !finished?
	end

	def finished?
		#balance == 0
		false
	end

	def balance
		# instalment_sum == amortizations.sum(:value_cents)
	end

	# Saldo devedor
	def outstanding_balance final_date = Date.today
		#return 1
		withdraws.where(date: signature_date..final_date).sum(:value) - amortizations.where(date: signature_date..final_date).sum(:value)
	end

	def years_list
		signature_date.year..(signature_date + loan_term.months).year
	end

	def withdraws_pro_rata
		result = []
		withdraws.where(date: reference_period).each do |withdraw|
			result += result + [withdraw.value * withdraw.period]
		end
	end

	def withdraws_values_by_year
		withdraws.order('extract(year from date)').group('extract(year from date)').pluck("extract(year from date), sum(value), sum(value_brl)")
	end

	def transaction_items_month_total month, year, category_number = nil		
		result = transaction_items.where('extract(month from date) = ?', month).where('extract(year from date) = ?', year)
		result = result.where(transaction_infos: { category_number: category_number }) if category_number.present? && category_number != 1
		result = result.sum(:value_brl)
	end

	def transaction_items_year_total month, year, category_number = nil		
		result = transaction_items.where(date: Date.new(year)..Date.new(year,month).end_of_month)
		result = result.where(transaction_infos: { category_number: category_number }) if category_number.present? && category_number != 1
		result = result.sum(:value_brl)
	end

	def last_year
		(grace_period + loan_term.months).year
	end

	private

		def self.date_range_from_year year
			Date.new(year)..(Date.new(year + 1) - 1.day)
		end

		def instalment_formula_numerator
			( ( (1 + interest_rate_per_month) ** (loan_term - amortizations.count) ) * interest_rate_per_month )
		end

		def instalment_formula_denominator
			( ( ( 1 + interest_rate_per_month ) ** (loan_term - amortizations.count) ) - 1 )
		end

		def interest_rate_per_month
			interest_rate
		end
end
