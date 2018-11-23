class Debt < ApplicationRecord
	monetize :contract_value_cents

	belongs_to :creditor

	validates :code, presence: true, numericality: { only_integer: true }, length: { is: 6 }
	validates :contract_value_cents, presence: true
	validates :signature_date, presence: true
	validates :amortization_period, presence: true
end
