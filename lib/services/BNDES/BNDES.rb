require 'open-uri'

class BNDES
	CURRENCY_FILE_URL =	"https://www.bndes.gov.br/Moedas/umCODE.txt"

	class << self
		def get_currency code
			result = Hash.new

			open(CURRENCY_FILE_URL.gsub!("CODE", code), "r") do |file|
			  result = parse file
			end
			
			result
		end

		private
			def parse file
				result = Hash.new

				lines = file.readlines.map(&:chomp)
				lines.shift

				lines.each do |line|
					# 01/04/2019;       2,050422	    	
		    	line_array = line.split(' ')
		    	result[line_array.first.chomp(';')] = line_array.last
		    end

		    result
			end
	end
end