class Transaction < ApplicationRecord
	belongs_to :debt
	
	validates :date, presence: true

	before_save :set_outstanding_balance

	def editable?
		Transaction.where(debt_id: debt.id).maximum(:id) == id
	end

	private
		def set_outstanding_balance
			self.start_outstanding_balance = debt.outstanding_balance
		end
end
