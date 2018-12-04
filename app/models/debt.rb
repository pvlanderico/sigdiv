class Debt < ApplicationRecord
	monetize :contract_value_cents

	belongs_to :creditor
	belongs_to :financial_agent, class_name: :creditor, optional: true

	has_many :charges, inverse_of: :debt

	enum amortization_type: [:Sac, :Price, :Single]
	enum amortization_frequencies: [:Mensal, :Trimestral, :Semestral]
	enum legislation_level: [:Federal, :Estadual, :Municipal]

	validates :code, presence: true, numericality: { only_integer: true }, length: { is: 6 }
	validates :contract_value_cents, presence: true
	validates :signature_date, presence: true
	validates :amortization_period, presence: true
end
