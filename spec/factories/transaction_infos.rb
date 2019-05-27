FactoryBot.define do
	factory :transaction_info do
	  factory :debt_withdraw do
	  	formula { '' }
			pro_rata { false }
			payment_day { '' }
			description { '' }
			frequency { '' }
			association :debt, factory: :debt
			association :type, factory: :withdraw
	  end

	  factory :debt_amortization do
	  	formula { '' }
			pro_rata { false }
			payment_day { '' }
			description { '' }
			frequency { '' }
			association :debt, factory: :debt
			association :type, factory: :amortization
	  end
	end
end