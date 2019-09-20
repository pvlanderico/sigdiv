class FutureTransaction < TransactionItem
	attr_accessor :projection_debt

	def editable?
		false
	end
		
end