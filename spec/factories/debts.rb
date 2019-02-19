FactoryBot.define do
  factory :debt do
  	code { Faker::Number.number(6) }
		contract_value_cents { Faker::Number.number(8) }
		signature_date { Faker::Date.between(Date.parse('01/01/2010'), Date.parse('01/01/2013')) }
		creditor
		grace_period { Faker::Date.between(Date.parse('01/01/2013'), Date.parse('01/12/2013')) }
		amortization_type { Debt.amortization_types.values.sample }
		amortization_period  { Faker::Date.between(Date.parse('01/01/2014'), Date.parse('01/12/2014')) }
		amortization_frequency { Debt.amortization_frequencies.values.sample }
		name { Faker::Bank.name }
		category { Debt.categories.values.sample }
		grace_period_rate_frequency { Debt.grace_period_rate_frequencies.values.sample }
		interest_rate_formula { 0.1 }
		loan_term { 120 }
		payment_day { Date.tomorrow.day }
		association :currency, factory: :uprd
  	
  	factory :cef do
	    contract_value_cents { 29232000000 }
	    signature_date { Date.parse '19/11/2013' }	    
	    grace_period { Date.parse '19/11/2017' }
	    amortization_type { 'price' }
	    amortization_period { Date.parse '19/11/2033' }    
	    amortization_frequency { 'mensal' }    
	    name  { 'Transoceânica' }
	    category  { 'interno' }
	    grace_period_rate_frequency  { 'mensal' }
	    interest_rate_formula { 6 }
	    loan_term { 240 }
	    payment_day { 15 }
	  end
  end
end
