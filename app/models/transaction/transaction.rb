class Transaction < ApplicationRecord
	belongs_to :debt

	validates :value, presence: true
	validates :exchange_rate, presence: true
	validates :date, presence: true

	def self.by_year
		order(date: :asc).reduce({}) do |result, transaction| 
			result.update(transaction.date.year => { transaction.date.month => [transaction] }) do |year, old_month_hash, new_month_hash|
				old_month_hash.update(new_month_hash) do |month, old_transactions_array, new_transactions_array|
					old_transactions_array + new_transactions_array
				end
			end
		end.reverse_each.to_h
	end
end
