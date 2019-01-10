class Currency < ApplicationRecord
	validates :name, presence: true
	validates :formula, presence: true

	def to_brl
		Dentaku(eval_formula)
	end

	private
		def eval_formula
			formula.gsub!(/\[(\d*)\]/) do
				BancoCentral.last($1.to_i)[:value]
			end
			formula
		end
end
