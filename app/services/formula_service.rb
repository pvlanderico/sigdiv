class FormulaService
	VARIABLES = {	'SALDO' => :outstanding_balance, 
								'JUROS' => :interest_rate,
								'PARCELAS' => :loan_term,
								'PGTO'	=> :amortization,
								'DiNi' 	=> [:withdraw, :value, :period] }
	
	class << self
		
		def eval formula, debt		
			Dentaku(parse(formula, debt))
		end

		def parse formula, debt
			if (formula.match(/\[SOMA\(.*\)\]/))
				formula.gsub!(/\[SOMA\(.*\)\]/, summation(formula.match(/\[SOMA\((.*)\)\]/).captures.first, debt).to_s)
			end
			
			result = formula.dup			
			formula.gsub(/\[(\w*)\]/) do	
							
				method_name = VARIABLES[$1]							
				
				result.gsub!("[#{$1}]", send_method(debt, method_name))		
			end
			
			result
		end

		def send_method debt, method_name
			if debt.balance_projection.present? && method_name == :outstanding_balance 
				debt.balance_projection.to_s
			else
				debt.send(method_name).to_s
			end
		end

		def summation formula, debt
			result = 0

			objects = collect(VARIABLES[formula], debt)

			objects.each do |object|
				result += object
			end

			result
		end

		def collect formula_params, debt
			
			object_name = formula_params[0] #withdraw
			var1 = formula_params[1] #value Dn
			var2 = formula_params[2] #period Nn

			result = []

			debt.send(object_name.to_s.pluralize).each do |object|
				result << object.send(var1) * object.send(var2)
			end

			result
		end
	end
end