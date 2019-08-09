Creditor.destroy_all
Currency.destroy_all
TransactionInfo.destroy_all
TransactionItem.destroy_all
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
					    "name" => "Caixa Transoceânica",
					    "category" => 0,
					    "currency_id" => currency1.id,
					    "loan_term" => 240				    
					    )

#Charge.create!(name: 'Taxa administrativa', base: 2, debt: Debt.first, count_days: true)
#Charge.create!(name: 'Taxa de risco de crédito', base: 0.7, debt: Debt.first, count_days: false)

withdraw = TransactionInfo.create!(name: 'Desembolso', transaction_type_id: 1, debt: Debt.first, payment_day:'15')
interest = TransactionInfo.create!(name: 'Juros', transaction_type_id: 2, debt: Debt.first, payment_day:'15')
amortization =  TransactionInfo.create!(name: 'Amortização', transaction_type_id: 3, debt: Debt.first, payment_day:'15')
charges = TransactionInfo.create!(name: 'Encargos', transaction_type_id: 4, debt: Debt.first, payment_day:'15')

puts Date.new(2015, 5, 8)

TransactionItem.create!(				
	value: BigDecimal('38267.1771676987'),
	date: Date.new(2015, 5, 8),
	value_brl: BigDecimal('800224.90'),
	exchange_rate: BigDecimal('20.91152155'),
	transaction_info: withdraw
) 

puts Date.new(2015, 6, 19)

TransactionItem.create!(
	value: BigDecimal('100178.304001591'),
	date: Date.new(2015, 6, 19),
	value_brl: BigDecimal('2099165.37'),
	exchange_rate: BigDecimal('20.95429136'),
	transaction_info: withdraw
)

puts Date.new(2015, 7, 24)

TransactionItem.create!(
	value: BigDecimal('269454.113840257'),
	date: Date.new(2015, 7, 24),
	value_brl: BigDecimal('5659740.67'),
	exchange_rate: BigDecimal('21.00446933'),
	transaction_info: withdraw
)

puts Date.new(2015, 8 ,21)

TransactionItem.create!(
	value: BigDecimal('172811.612402003'),
	date: Date.new(2015, 8 ,21),
	value_brl: BigDecimal('3636516.20'),
	exchange_rate: BigDecimal('21.04323980'),
	transaction_info: withdraw
)

puts Date.new(2015, 9, 22)

TransactionItem.create!(
	value: BigDecimal('388238.148837079'),
	date: Date.new(2015, 9, 22),
	value_brl: BigDecimal('8185330.12'),
	exchange_rate: BigDecimal('21.08327104'),
	transaction_info: withdraw
)

puts Date.new(2015, 10, 22)

TransactionItem.create!(
	value: BigDecimal('180241.335471127'),
	date: Date.new(2015, 10, 22),
	value_brl: BigDecimal('3807043.73'),
	exchange_rate: BigDecimal('21.12192367'),
	transaction_info: withdraw
)

puts Date.new(2015, 11, 23)
  
TransactionItem.create!(
	value: BigDecimal('776149.536786542'),
	date: Date.new(2015, 11, 23),
	value_brl: BigDecimal('16418436.94'),
	exchange_rate: BigDecimal('21.15370320'),
	transaction_info: withdraw
)

puts Date.new(2015, 12, 17)

TransactionItem.create!(
	value: BigDecimal('2027839.19399659'),
	date: Date.new(2015, 12, 17),
	value_brl: BigDecimal('42965630.86'),
    exchange_rate: BigDecimal('21.18788856'),
	transaction_info: withdraw
)

puts Date.new(2016, 3, 15)

TransactionItem.create!(
	value: BigDecimal('1480367.51522129'),
	date: Date.new(2016, 3, 15),
	value_brl: BigDecimal('31500447.14'),
	exchange_rate: BigDecimal('21.27880193'),
	transaction_info: withdraw

)

puts Date.new(2016, 5, 6) 
  
TransactionItem.create!(
	value: BigDecimal('1986775.5527745'),
	date: Date.new(2016, 5, 6),
	value_brl: BigDecimal('42393733.38'),
	exchange_rate: BigDecimal('21.33795804'),
	transaction_info: withdraw

)

puts Date.new(2016, 6, 27)

TransactionItem.create!(
	value: BigDecimal('383515.163323288'),
	date: Date.new(2016, 6, 27),
	value_brl: BigDecimal('8207278.03'),
	exchange_rate: BigDecimal('21.40013959'),
	transaction_info: withdraw
)

puts Date.new(2016, 7, 29)

TransactionItem.create!(
	value: BigDecimal('611973.657811069'),
	date: Date.new(2016, 7, 29),
	value_brl: BigDecimal('13121407.28'),
	exchange_rate: BigDecimal('21.44113086'),
	transaction_info: withdraw
)

puts Date.new(2016, 8, 30)

TransactionItem.create!(
	value: BigDecimal('573211.706951141'),
	date: Date.new(2016, 8, 30),
	value_brl: BigDecimal('12319813.16'),
	exchange_rate: BigDecimal('21.49260563'),
	transaction_info: withdraw
)

puts Date.new(2016, 9, 30)

TransactionItem.create!(
	value: BigDecimal('577590.254823738'),
	date: Date.new(2016, 9, 30),
	value_brl: BigDecimal('12435287.93'),
	exchange_rate: BigDecimal('21.52960135'),
	transaction_info: withdraw
)

puts Date.new(2016, 10, 28)
 
TransactionItem.create!(
	value: BigDecimal('508924.2218972'),
	date: Date.new(2016, 10, 28),
	value_brl: BigDecimal('10973544.54'),
	exchange_rate: BigDecimal('21,56223671'),
	transaction_info: withdraw
)

puts Date.new(2016, 11, 30)

TransactionItem.create!(
	value: BigDecimal('715325.306302176'),
	date: Date.new(2016, 11, 30),
	value_brl: BigDecimal('15447408.00'),
	exchange_rate: BigDecimal('21.59494130'),
	transaction_info: withdraw
)

puts Date.new(2016, 12, 22)

TransactionItem.create!(
	value: BigDecimal('550758.880241646'),
	date: Date.new(2016, 12, 22),
	value_brl: BigDecimal('11909445.03'),
	exchange_rate: BigDecimal('21.62370042'),
	transaction_info: withdraw
)

puts Date.new(2017, 1, 31)

TransactionItem.create!(
	value: BigDecimal('270839.770669423'),
	date: Date.new(2017, 1, 31),
	value_brl: BigDecimal('5869510.23'),
	exchange_rate: BigDecimal('21.67152267'),
	transaction_info: withdraw
)

puts Date.new(2017, 3, 2)
  
TransactionItem.create!(
	value: BigDecimal('286313.741213063'),
	date: Date.new(2017, 3, 2),
	value_brl: BigDecimal('6207267.82'),
	exchange_rate: BigDecimal('21.67995079'),
	transaction_info: withdraw
)

puts Date.new(2017, 5, 2)

TransactionItem.create!(
	value: BigDecimal('109984.5161992'),
	date: Date.new(2017, 5, 2),
	value_brl: BigDecimal('2388057.81'),
	exchange_rate: BigDecimal('21.71267277'),
	transaction_info: withdraw
)

puts Date.new(2017, 6, 30)

TransactionItem.create!(
	value: BigDecimal('295191.232075548'),
	date: Date.new(2017, 6, 30),
	value_brl: BigDecimal('6417561.70'),
	exchange_rate: BigDecimal('21.74035338'),
	transaction_info: withdraw
)

puts Date.new(2017, 9, 18)

TransactionItem.create!(
	value: BigDecimal('351624.161135471'),
	date: Date.new(2017, 9, 18),
	value_brl: BigDecimal('7653284.73'),
	exchange_rate: BigDecimal('21.76552574'),
	transaction_info: withdraw
)

puts Date.new(2017, 11, 13)

TransactionItem.create!(
	value: BigDecimal('252538.2031043'),
	date: Date.new(2017, 11, 13),
	value_brl: BigDecimal('5496626.76'),
	exchange_rate: BigDecimal('21,76552574'),
	transaction_info: withdraw
)

puts "Juros"
puts Date.new(2015, 05, 15)

TransactionItem.create!(
	value: BigDecimal('191.33589'),
	date: Date.new(2015, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('20.91152155'),
	transaction_info: interest
)


