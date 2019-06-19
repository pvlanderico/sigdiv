class TransactionInfo < ApplicationRecord
	enum frequency: [:mensal, :trimestral, :semestral]

	belongs_to :debt
	belongs_to :type, class_name: 'TransactionType', foreign_key: :transaction_type_id
	has_many :items, class_name: 'TransactionItem', foreign_key: :transaction_info_id

	accepts_nested_attributes_for :type, reject_if: :all_blank

	def payment_date
		Date.new(Date.today.year, Date.today.month, payment_day)
	end

	def reference_period			
		(payment_date - 1.month + 1.day)..payment_date
	end
	
end