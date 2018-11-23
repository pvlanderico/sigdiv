class Creditor < ApplicationRecord
	has_many :debts

	validates :name, presence: true
end
