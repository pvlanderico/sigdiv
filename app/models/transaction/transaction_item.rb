class TransactionItem < ApplicationRecord
	belongs_to :transaction_info

	before_save :set_outstanding_balance

	validates :value, presence: true
	validates :value_brl, presence: true

	def editable?
		TransactionItem.where(debt_id: debt.id).maximum(:id) == id
	end

	def final_outstanding_balance
		Dentaku(start_outstanding_balance.to_s + transaction_info.type.operator + value.to_s)
	end

	private
		def set_outstanding_balance
			self.start_outstanding_balance = debt.outstanding_balance
		end

end