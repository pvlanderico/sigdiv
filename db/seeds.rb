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
	puts '*******************************************************'
end

puts Date.new(2015, 5, 8)
show_stats
Withdraw.create!(				
	value: BigDecimal('38267.1771676987'),
	date: Date.new(2015, 5, 8),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('800224.90')
) 

puts Date.new(2015, 6, 19)
show_stats
Withdraw.create!(
	value: BigDecimal('100178.304001591'),
	date: Date.new(2015, 6, 19),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('2099165.37')
)

puts Date.new(2015, 7, 24)
show_stats
Withdraw.create!(
	value: BigDecimal('269454.113840257'),
	date: Date.new(2015, 7, 24),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('5659740.67')
)

puts Date.new(2015, 8 ,21)
show_stats
Withdraw.create!(
	value: BigDecimal('172811.612402003'),
	date: Date.new(2015, 8 ,21),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('3636516.20')
)

puts Date.new(2015, 9, 22)
show_stats
Withdraw.create!(
	value: BigDecimal('388238.148837079'),
	date: Date.new(2015, 9, 22),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('8185330.12')
)

puts Date.new(2015, 10, 22)
show_stats
Withdraw.create!(
	value: BigDecimal('180241.335471127'),
	date: Date.new(2015, 10, 22),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('3807043.73')
)

puts Date.new(2015, 11, 23)
show_stats
Withdraw.create!(
	value: BigDecimal('776149.536786542'),
	date: Date.new(2015, 11, 23),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('16418436.94')
)

puts Date.new(2015, 12, 17)
show_stats
Withdraw.create!(
	value: BigDecimal('2027839.19399659'),
	date: Date.new(2015, 12, 17),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('42965630.86')
)

puts Date.new(2016, 3, 15)
show_stats
Withdraw.create!(
	value: BigDecimal('1480367.51522129'),
	date: Date.new(2016, 3, 15),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('31500447.14')
)

puts Date.new(2016, 5, 6)
show_stats
Withdraw.create!(
	value: BigDecimal('1986775.5527745'),
	date: Date.new(2016, 5, 6),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('42393733.38')
)

puts Date.new(2016, 6, 27)
show_stats
Withdraw.create!(
	value: BigDecimal('383515.163323288'),
	date: Date.new(2016, 6, 27),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('8207278.03')
)

puts Date.new(2016, 7, 29)
show_stats
Withdraw.create!(
	value: BigDecimal('611973.657811069'),
	date: Date.new(2016, 7, 29),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('13121407.28')
)

puts Date.new(2016, 8, 30)
show_stats
Withdraw.create!(
	value: BigDecimal('573211.706951141'),
	date: Date.new(2016, 8, 30),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('12319813.16')
)

puts Date.new(2016, 9, 30)
show_stats
Withdraw.create!(
	value: BigDecimal('577590.254823738'),
	date: Date.new(2016, 9, 30),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('12435287.93')
)

puts Date.new(2016, 10, 28)
show_stats
Withdraw.create!(
	value: BigDecimal('508924.2218972'),
	date: Date.new(2016, 10, 28),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('10973544.54')
)

puts Date.new(2016, 11, 30)
show_stats
Withdraw.create!(
	value: BigDecimal('715325.306302176'),
	date: Date.new(2016, 11, 30),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('15447408.00')
)

puts Date.new(2016, 12, 22)
show_stats
Withdraw.create!(
	value: BigDecimal('550758.880241646'),
	date: Date.new(2016, 12, 22),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('11909445.03')
)

puts Date.new(2017, 1, 31)
show_stats
Withdraw.create!(
	value: BigDecimal('270839.770669423'),
	date: Date.new(2017, 1, 31),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('5869510.23')
)

puts Date.new(2017, 3, 2)
show_stats
Withdraw.create!(
	value: BigDecimal('286313.741213063'),
	date: Date.new(2017, 3, 2),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('6207267.82')
)

puts Date.new(2017, 5, 2)
show_stats
Withdraw.create!(
	value: BigDecimal('109984.5161992'),
	date: Date.new(2017, 5, 2),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('2388057.81')
)

puts Date.new(2017, 6, 30)
show_stats
Withdraw.create!(
	value: BigDecimal('295191.232075548'),
	date: Date.new(2017, 6, 30),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('6417561.70')
)

puts Date.new(2017, 9, 18)
show_stats
Withdraw.create!(
	value: BigDecimal('351624.161135471'),
	date: Date.new(2017, 9, 18),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('7653284.73')
)

puts Date.new(2017, 11, 13)
show_stats
Withdraw.create!(
	value: BigDecimal('252538.2031043'),
	date: Date.new(2017, 11, 13),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('5496626.76')
)

puts "Primeiro Pagamento"
puts Date.new(2017, 12, 15)
show_stats
Payment.create!(	
	date: Date.new(2017, 12, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('608067.11')
)

puts Date.new(2018, 1, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 1, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('611107.45')
)

puts Date.new(2018, 2, 5)
show_stats
Withdraw.create!(
	value: BigDecimal('288019.18249'),
	date: Date.new(2018, 2, 5),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('6268888.93')
)

puts Date.new(2018, 2, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 2, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('627926.55')
)

puts Date.new(2018, 3, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 3, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('631066.18')
)

puts Date.new(2018, 4, 16)
show_stats
Payment.create!(	
	date: Date.new(2018, 4, 16),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('634221.51')
)

puts Date.new(2018, 5, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 5, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('637392.62')
)

puts Date.new(2018, 6, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 6, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('640579.58')
)

puts Date.new(2018, 7, 16)
show_stats
Payment.create!(	
	date: Date.new(2018, 7, 16),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('643782.48')
)

puts Date.new(2018, 8, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 8, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('647001.40')
)

puts Date.new(2018, 9, 17)
show_stats
Payment.create!(	
	date: Date.new(2018, 9, 17),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('650236.40')
)

puts Date.new(2018, 10, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 10, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('653487.58')
)

puts Date.new(2018, 10, 31)
show_stats
Withdraw.create!(
	value: BigDecimal('208970.05587'),
	date: Date.new(2018, 10, 31),
	debt_id: Debt.first.id,
	value_brl: BigDecimal('4548343.13')
)

puts Date.new(2018, 11, 16)
show_stats
Payment.create!(	
	date: Date.new(2018, 11, 16),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('667414.42')
)

puts Date.new(2018, 12, 15)
show_stats
Payment.create!(	
	date: Date.new(2018, 12, 15),
	debt_id: Debt.first.id,
	principal_brl: BigDecimal('670751.50')
)