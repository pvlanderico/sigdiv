FactoryBot.define do
	factory :currency do
		
		factory :brl do
			name { 'BRL' }
			formula { '1' }
		end

		factory :uprd do
			name { 'UPRD' }
			formula { 'TODO' }
		end
	end
end