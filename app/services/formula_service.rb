class FormulaService
	VARIABLES = { 'SUM'   => :sum,
								'SALDO' => :outstanding_balance, 
								'JUROS' => :interest_rate,
								'PARCELAS' => :loan_term,
								'DiNi' 	=> [:withdraw, :value, :period] }
	class << self
		#FormulaService::eval(formula, debt)

		def eval formula, debt			
			Dentaku(parse(formula, debt))
		end

		def parse formula, debt
			result = formula.dup

			formula.gsub(/\[(\w*)\]/) do
				value = VARIABLES[$1]				
				result.gsub!("[#{$1}]", debt.send(value).to_s)
			end
			
			result
		end

		def sum objects

VARIABLES.each do |key, value|
				if formula.match(/\[\w*\(.*\)\]/)
					sum_formula = formula.match(/SUM\((.*)\)/)

					formula.gsub!(/SUM\(.*\)/, sum(collect(sum_formula, debt)))					
				
				elsif key == 'DiNi' && formula.match(/DiNi/)
					return value

				else
					formula.gsub!(key, debt.send(value.to_s))
				end

			end


			result = 0

			objects.each do |object|
				result += object
			end

			result
		end

		def collect formula_params, debt
			
			object_name = formula_params[0]
			var1 = formula_params[1]
			var2 = formula_params[2]

			result = []

			debt.send(object_name.pluralize).each do |object|
				result =+ var1 * var2
			end

			result
		end
	end
end