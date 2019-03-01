class Withdraw < Transaction
	def final_outstanding_balance
		start_outstanding_balance + value
	end
end