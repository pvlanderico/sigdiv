FactoryBot.define do
<<<<<<< HEAD
	factory :currency do
		
		factory :brl do
			name { 'BRL' }
			formula { '1' }
		end

		factory :uprd do
			name { 'UPRD' }
			formula { 'TODO' }
		end
=======
	factory :currency, aliases: [:uprd] do
		name { 'UPRD' }
		formula { '0.5' }
>>>>>>> withdraw-refactor
	end
end