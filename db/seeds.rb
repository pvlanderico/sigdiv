Creditor.destroy_all
Currency.destroy_all
Transaction.destroy_all
Charge.destroy_all
Debt.destroy_all

creditor1 = Creditor.create!(name: 'CAIXA ECONÔMICA FEDERAL', financial_agent: true)
creditor2 = Creditor.create!(name: 'BRADESCO', financial_agent: false)
creditor3 = Creditor.create!(name: 'BNDES', financial_agent: true)

currency1 = Currency.create!(name: 'BRL', formula: '1')
currency2 = Currency.create!(name: 'USD', formula: '[BACEN1]')
currency3 = Currency.create!(name: 'URTJLP', formula: '[BNDES314]')

Debt.create!( "code" => 123456,
					    "contract_value" => 292320000,
					    "signature_date" => Date.parse('19/11/2013'),
					    "creditor_id" => creditor1.id,
					    "grace_period" => Date.parse('19/11/2017'),
					    "amortization_period" => Date.parse('19/11/2033'),
					    "purpose" => "Construção Trans Oceanica",
					    "amortization_type" => 0,
					    "amortization_frequency" => 1,
					    "name" => "Caixa Transoceânica",
					    "category" => 0,
					    "currency_id" => currency1.id,
					    "interest_rate_formula" => 6,
					    "loan_term" => 240,
					    "payment_day" => 15					    
					    )

Charge.create!(name: 'Taxa administrativa', base: 2, debt: Debt.first, count_days: true)
Charge.create!(name: 'Taxa de risco de crédito', base: 0.7, debt: Debt.first, count_days: false)

def show_stats
	puts '*******************************************************'
	puts "Saldo devedor: " + Debt.first.show_outstanding_balance.to_s
	puts "Juros: " + Debt.first.show_interest.to_s
	puts "Próxima parcela: " + Debt.first.show_next_instalment.to_s
end

show_stats
Withdraw.create!(				
	value: BigDecimal('38267.1771676987'),
	date: Date.new(2015, 5, 8),
	exchange_rate: 1,
	debt_id: Debt.first.id
) 

show_stats
Withdraw.create!(
	value: BigDecimal('100178.304001591'),
	date: Date.new(2015, 6, 19),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('269454.113840257'),
	date: Date.new(2015, 7, 24),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('172811.612402003'),
	date: Date.new(2015, 8 ,21),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('388238.148837079'),
	date: Date.new(2015, 9, 22),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('180241.335471127'),
	date: Date.new(2015, 10, 22),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('776149.536786542'),
	date: Date.new(2015, 11, 23),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('2027839.19399659'),
	date: Date.new(2015, 12, 17),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('1480367.51522129'),
	date: Date.new(2016, 3, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('1986775.5527745'),
	date: Date.new(2016, 5, 6),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('383515.163323288'),
	date: Date.new(2016, 6, 27),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('611973.657811069'),
	date: Date.new(2016, 7, 29),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('573211.706951141'),
	date: Date.new(2016, 8, 30),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('577590.254823738'),
	date: Date.new(2016, 9, 30),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('508924.2218972'),
	date: Date.new(2016, 10, 28),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('715325.306302176'),
	date: Date.new(2016, 11, 30),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('550758.880241646'),
	date: Date.new(2016, 12, 22),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('270839.770669423'),
	date: Date.new(2017, 1, 31),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('286313.741213063'),
	date: Date.new(2017, 3, 2),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('109984.5161992'),
	date: Date.new(2017, 5, 2),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('295191.232075548'),
	date: Date.new(2017, 6, 30),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('351624.161135471'),
	date: Date.new(2017, 9, 18),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('252538.2031043'),
	date: Date.new(2017, 11, 13),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

puts "Primeiro Pagamento"
show_stats
Payment.create!(
	principal: BigDecimal('27937.1662582689'),
	date: Date.new(2017, 12, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('28076.8520795603'),
	date: Date.new(2018, 1, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('288019.18249'),
	date: Date.new(2018, 2, 5),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('28849.5926027793'),
	date: Date.new(2018, 2, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('28993.8405657932'),
	date: Date.new(2018, 3, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('29138.80976862210'),
	date: Date.new(2018, 4, 16),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('29284.5038174652'),
	date: Date.new(2018, 5, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('29430.92633655260'),
	date: Date.new(2018, 6, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('29578.08096823530'),
	date: Date.new(2018, 7, 16),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('29725.97137307650'),
	date: Date.new(2018, 8, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('29874.60122994190'),
	date: Date.new(2018, 9, 17),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('30023.97423609160'),
	date: Date.new(2018, 10, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Withdraw.create!(
	value: BigDecimal('208970.05587'),
	date: Date.new(2018, 10, 31),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('30663.83199352860'),
	date: Date.new(2018, 11, 16),
	exchange_rate: 1,
	debt_id: Debt.first.id
)

show_stats
Payment.create!(
	principal: BigDecimal('30817.15115349630'),
	date: Date.new(2018, 12, 15),
	exchange_rate: 1,
	debt_id: Debt.first.id
)