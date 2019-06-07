FactoryBot.define do
	factory :transaction_type do
		factory :withdraw do
		  name { TransactionType::BASIC_TYPES[1][:name] }
		  operator { TransactionType::BASIC_TYPES[1][:operator] }
		end

		factory :amortization do
		  name { TransactionType::BASIC_TYPES[2][:name] }
		  operator { TransactionType::BASIC_TYPES[2][:operator] }
		end

		factory :interest do
		  name { TransactionType::BASIC_TYPES[3][:name] }
		  operator { TransactionType::BASIC_TYPES[3][:operator] }
		end
	end
end
