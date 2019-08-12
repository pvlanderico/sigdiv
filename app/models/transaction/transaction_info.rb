class TransactionInfo < ApplicationRecord
	BASIC_TYPES = [ {name: 'Desembolso', operator: '+'}, 
									{name: 'Juros', operator: '-'},
									{name: 'Amortização', operator: '-'},
									{name: 'Encargos', operator: '-' } ]
	
	enum frequency: [:mensal, :trimestral, :semestral]

	belongs_to :debt

	has_many :items, class_name: 'TransactionItem', foreign_key: :transaction_info_id

	def payment_date
		Date.new(Date.today.year, Date.today.month, payment_day)
	end

	def reference_period			
		(payment_date - 1.month + 1.day)..payment_date
	end

	def next_amount
		FormulaService.eval formula, debt
	end
	
	def category
		OpenStruct.new(BASIC_TYPES[1])
	end
	
end