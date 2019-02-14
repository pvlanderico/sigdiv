FactoryBot.define do
	factory :charge do
		factory :adm_tax do
			name { 'Taxa administrativa' }
			base { 0.166666667 }
		end

		factory :credit_risk do
			name { 'Risco de crédito' }
			base { 0.058333333 }
		end
	end
end