class TransactionType < ApplicationRecord
	BASIC_TYPES = { 1 => {name: 'Desembolso', operator: '+'}, 2 => {name: 'Amortização', operator: '-'} }

	has_many :transaction_infos

	validates :name, presence: true
	validates :operator, presence: true
end
