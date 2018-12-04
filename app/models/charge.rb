class Charge < ApplicationRecord
	belongs_to :debt
	
	validates :name, presence: true
end
