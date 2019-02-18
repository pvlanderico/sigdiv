class Transaction < ApplicationRecord
	belongs_to :debt

	validates :value, presence: true
	validates :exchange_rate, presence: true
	validates :date, presence: true
end
