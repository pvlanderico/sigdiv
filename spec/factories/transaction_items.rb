FactoryBot.define do
	factory :transaction_item do
		factory :withdraw_20151221 do
			value { 577590.25482 }
			exchange_rate { 21.52960135 }
			value_brl { 12435287.93 }
			date { Date.new 2015,12,21 }
			association :transaction_info, factory: :debt_withdraw
		end

		factory :withdraw_20151215 do
			value { 20000 }
			value_brl { 5000 }
			date { Date.new 2015,12,15 }
			association :transaction_info, factory: :debt_withdraw
		end
	end
end