class TransactionInfo < ApplicationRecord
	enum frequency: [:mensal, :trimestral, :semestral]

	belongs_to :debt
	belongs_to :type, class_name: 'TransactionType', foreign_key: :transaction_type_id
	has_many :items, class_name: 'TransactionItem', foreign_key: :transaction_info_id

	accepts_nested_attributes_for :type
	
end