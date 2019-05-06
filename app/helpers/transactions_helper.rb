module TransactionsHelper
	def order_by_year transactions
		transactions.sort { |a, b| a.date <=> b.date }.reduce({}) do |result, transaction| 
			result.update(transaction.date.year => { transaction.date.month => [transaction] }) do |year, old_month_hash, new_month_hash|
				old_month_hash.update(new_month_hash) do |month, old_transactions_array, new_transactions_array|
					old_transactions_array + new_transactions_array
				end
			end
		end.to_h
	end
end
