class TransactionItem < ApplicationRecord
	belongs_to :transaction_info
	has_one :debt, through: :transaction_info

	before_save :set_outstanding_balance

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

	def init(debt, type)
		self.debt = debt
		self.transaction_info = debt.transaction_infos.where(transaction_infos: { transaction_type_id: TransactionType.find_by(name: type).id} ).first
	end

	private
		def set_outstanding_balance
			self.start_outstanding_balance = debt.outstanding_balance
		end
end