class TransactionInfo < ApplicationRecord
	belongs_to :debt
	belongs_to :transaction_type
	has_many :transaction_items

	accepts_nested_attributes_for :transaction_type
	
	def type
		transaction_type
	end
end