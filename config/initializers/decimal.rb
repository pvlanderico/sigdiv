class Decimal < BigDecimal 
	def self.new value
		super(value, 15)
	end
end