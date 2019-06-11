class FormulaUtils
	VARIABLES = { 'SUM'   => :sum,
								'SALDO' => :outstanding_balance, 
								'JUROS' => :interest_rate,
								'PARCELAS' => :loan_term							
								'DiNi' 	=> [:withdraw, :value, :period] }
	class << self
		#FormulaUtils::eval(formula, debt)

		def eval formula, debt
			Dentaku(parse(formula, debt))
		end

		def parse formula, debt
			VARIABLES.each do |var|

				if var.key == 'SUM'
					sum_formula = formula.match(/SUM\((.*)\)/)

					formula.gsub!(/SUM\(.*\)/, sum(collect(sum_formula, debt)))					
				end

				if var.key == 'DiNi'
					return var.value
				end

				formula.gsub!(var.key, debt.send(var.value.to_s))
			end
		end

		def sum objects
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