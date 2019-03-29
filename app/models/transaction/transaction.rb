class Transaction < ApplicationRecord
	belongs_to :debt
	
	validates :date, presence: true

	before_save :set_outstanding_balance

	def self.by_year
		order(date: :asc).reduce({}) do |result, transaction| 
			result.update(transaction.date.year => { transaction.date.month => [transaction] }) do |year, old_month_hash, new_month_hash|
				old_month_hash.update(new_month_hash) do |month, old_transactions_array, new_transactions_array|
					old_transactions_array + new_transactions_array
				end
			end
		end.reverse_each.to_h
	end

	private
		def set_outstanding_balance
			self.start_outstanding_balance = debt.outstanding_balance
		end
end
