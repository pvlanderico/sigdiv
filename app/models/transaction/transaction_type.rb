class TransactionType < ApplicationRecord
	BASIC_TYPES = {1 => 'Desembolso', 2 => 'Amortização'}

	has_many :transaction_infos

	validates :name, presence: true
	validates :operator, presence: true
end
