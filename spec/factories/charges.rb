FactoryBot.define do
	factory :charge do
		factory :adm_tax do
			name { 'Taxa administrativa' }
			base { 2 }			
		end

		factory :credit_risk do
			name { 'Risco de crédito' }
			base { 0.7 }
		end
	end
end