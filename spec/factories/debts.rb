FactoryBot.define do
  factory :debt do
  	code { Faker::Number.number(6) }
		contract_value { Faker::Number.number(8) }
		signature_date { Faker::Date.between(Date.parse('01/01/2010'), Date.parse('01/01/2013')) }
		creditor
		grace_period { Faker::Date.between(Date.parse('01/01/2013'), Date.parse('01/12/2013')) }
		amortization_type { Debt.amortization_types.values.sample }
		amortization_period  { Faker::Date.between(Date.parse('01/01/2014'), Date.parse('01/12/2014')) }		
		name { Faker::Bank.name }
		category { Debt.categories.values.sample }		
		interest_rate_formula { 0.1 }
		loan_term { 120 }
		payment_day { Date.tomorrow.day }
		association :currency, factory: :uprd
  end
end
