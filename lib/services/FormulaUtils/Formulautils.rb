class FormulaUtils

	class << self
		def sum objects, formula
			result = 0

			objects.each do |object|
				result += parse(formula)
			end

			result
		end
	end
end