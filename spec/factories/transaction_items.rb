FactoryBot.define do
	factory :transaction_item do
		factory :withdraw_20151221 do
			value { 10000 }
			value_brl { 5000 }
			date { Date.new 2015,12,21 }
			association :type, :withdraw
		end
	end
end