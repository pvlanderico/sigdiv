module ApplicationHelper
	def big_decimal_to_currency number
		number_to_currency number, precision: 5, unit: ''
	end

	def big_decimal_to_currency_cents number
		number_to_currency number, precision: 2, unit: ''
	end
end
