class TransactionItem < ApplicationRecord
	belongs_to :transaction_info
	has_one :debt, through: :transaction_info

	before_save :set_start_balance

	validates :value, presence: true
	validates :value_brl, presence: true

	def editable?
		true
	end

	def final_outstanding_balance
		Dentaku("#{start_outstanding_balance} + #{transaction_info.type.operator} + #{value}")
	end

	def type
		transaction_info.type
	end

	def period
		result = ((transaction_info.payment_date) - date).to_i
		result = 30 if result == 31
		result
	end

	private
		def set_start_balance
			self.start_balance = debt.outstanding_balance
		end

end