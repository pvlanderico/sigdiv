class Debt < ApplicationRecord
	monetize :contract_value_cents

	belongs_to :creditor
	belongs_to :financial_agent, class_name: :creditor, optional: true

	has_many :charges, inverse_of: :debt

	accepts_nested_attributes_for :charges, reject_if: :all_blank, allow_destroy: true

	enum amortization_type: [:sac, :price, :single]
	enum amortization_frequencies: [:mensal, :trimestral, :semestral]
	enum legislation_level: [:federal, :estadual, :municipal]

	validates :code, presence: true, numericality: { only_integer: true }, length: { is: 6 }
	validates :contract_value_cents, presence: true
	validates :signature_date, presence: true
	validates :amortization_period, presence: true

	def next_instalment
		charges_total # + interest + amortization
	end

	private

	def interest
		#todo
	end

	def amortization
		#todo
	end

	def charges_total
		charges.reduce(0) { |sum, charge| sum + charge.total }
	end
end
