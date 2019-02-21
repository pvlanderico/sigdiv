class Transaction < ApplicationRecord
	belongs_to :debt

	validates :value, presence: true
	validates :exchange_rate, presence: true
	validates :date, presence: true

	def self.by_year
		order(date: :desc).reduce({}) do |result, transaction| 
			result.update(transaction.date.year => [transaction]) do |key, oldval, newval| 
				oldval + newval
			end
		end
	end
end
