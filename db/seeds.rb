Creditor.destroy_all
Currency.destroy_all
Debt.destroy_all

creditor1 = Creditor.create!(name: 'CAIXA', financial_agent: true)
creditor2 = Creditor.create!(name: 'BRADESCO', financial_agent: false)
creditor3 = Creditor.create!(name: 'BNDES', financial_agent: true)

currency1 = Currency.create!(name: 'BRL', formula: '1')
currency2 = Currency.create!(name: 'USD', formula: '[BACEN1]')
currency3 = Currency.create!(name: 'URTJLP', formula: '[BNDES314]')

Debt.create!( "code" => 123456,
					    "contract_value_cents" => 300000000,
					    "signature_date" => Date.today,
					    "creditor_id" => creditor1.id,
					    "grace_period" => 1.year.from_now,
					    "amortization_period" => 18.months.from_now,
					    "purpose" => "Construção Trans Oceanica",
					    "amortization_type" => 0,
					    "amortization_frequency" => 1,
					    "financial_agent_id" =>  creditor3.id,
					    "applicable_legislation" => "Lei 8112",
					    "legislation_level" => 2,
					    "name" => "Contrato Caixa",
					    "category" => 1,
					    "currency_id" => currency1.id,
					    #"grace_period_rate_frequency" => 0,
					    "interest_rate_formula" => "0,07" )