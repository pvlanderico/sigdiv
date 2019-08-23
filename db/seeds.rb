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
					    "interest_rate" => 0.005,
					    "loan_term" => 240
					    )

#Charge.create!(name: 'Taxa administrativa', base: 2, debt: Debt.first, count_days: true)
#Charge.create!(name: 'Taxa de risco de crédito', base: 0.7, debt: Debt.first, count_days: false)

withdraw = TransactionInfo.create!(category_number: 1, debt: Debt.first, payment_day:'15', formula: "[SALDO] * [JUROS]", slug: 'D')
interest = TransactionInfo.create!(category_number: 2, debt: Debt.first, payment_day:'15', formula: "[SALDO] * [JUROS]", slug: 'J')
amortization = TransactionInfo.create!(category_number: 3, debt: Debt.first, payment_day:'15', formula: "[SALDO] * [JUROS]", slug: 'A')
charges_adm = TransactionInfo.create!(category_number: 4, debt: Debt.first, payment_day:'15', description:'Taxa Adm', formula: "[SALDO] * [JUROS]", slug: 'TA')
charges_risc = TransactionInfo.create!(category_number: 4, debt: Debt.first, payment_day:'15', description:'Taxa Risco', formula: "[SALDO] * [JUROS]", slug: 'TR')

puts Date.new(2015, 5, 8)

TransactionItem.create!(				
	value: BigDecimal('38267.1771676987'),
	date: Date.new(2015, 5, 8),
	value_brl: BigDecimal('800224.90'),
	exchange_rate: BigDecimal('20.91152155'),
	transaction_info: withdraw,
	start_balance: BigDecimal('0')
) 

puts Date.new(2015, 6, 19)

TransactionItem.create!(
	value: BigDecimal('100178.304001591'),
	date: Date.new(2015, 6, 19),
	value_brl: BigDecimal('2099165.37'),
	exchange_rate: BigDecimal('20.95429136'),
	transaction_info: withdraw,
	start_balance: BigDecimal('38267.17717')
)

puts Date.new(2015, 7, 24)

TransactionItem.create!(
	value: BigDecimal('269454.113840257'),
	date: Date.new(2015, 7, 24),
	value_brl: BigDecimal('5659740.67'),
	exchange_rate: BigDecimal('21.00446933'),
	transaction_info: withdraw,
	start_balance: BigDecimal('138445.48117')
)

puts Date.new(2015, 8 ,21)

TransactionItem.create!(
	value: BigDecimal('172811.612402003'),
	date: Date.new(2015, 8 ,21),
	value_brl: BigDecimal('3636516.20'),
	exchange_rate: BigDecimal('21.04323980'),
	transaction_info: withdraw,
	start_balance: BigDecimal('407899.59501')
)

puts Date.new(2015, 9, 22)

TransactionItem.create!(
	value: BigDecimal('388238.148837079'),
	date: Date.new(2015, 9, 22),
	value_brl: BigDecimal('8185330.12'),
	exchange_rate: BigDecimal('21.08327104'),
	transaction_info: withdraw,
	start_balance: BigDecimal('580711.20741')
)

puts Date.new(2015, 10, 22)

TransactionItem.create!(
	value: BigDecimal('180241.335471127'),
	date: Date.new(2015, 10, 22),
	value_brl: BigDecimal('3807043.73'),
	exchange_rate: BigDecimal('21.12192367'),
	transaction_info: withdraw,
	start_balance: BigDecimal('968949.35625')
)

puts Date.new(2015, 11, 23)
  
TransactionItem.create!(
	value: BigDecimal('776149.536786542'),
	date: Date.new(2015, 11, 23),
	value_brl: BigDecimal('16418436.94'),
	exchange_rate: BigDecimal('21.15370320'),
	transaction_info: withdraw,
	start_balance: BigDecimal('1149190.69172')
)

puts Date.new(2015, 12, 17)

TransactionItem.create!(
	value: BigDecimal('2027839.19399659'),
	date: Date.new(2015, 12, 17),
	value_brl: BigDecimal('42965630.86'),
    exchange_rate: BigDecimal('21.18788856'),
	transaction_info: withdraw,
	start_balance: BigDecimal('1925340.22851')
)

puts Date.new(2016, 3, 15)

TransactionItem.create!(
	value: BigDecimal('1480367.51522129'),
	date: Date.new(2016, 3, 15),
	value_brl: BigDecimal('31500447.14'),
	exchange_rate: BigDecimal('21.27880193'),
	transaction_info: withdraw,
	start_balance: BigDecimal('3953179.42250')

)

puts Date.new(2016, 5, 6) 
  
TransactionItem.create!(
	value: BigDecimal('1986775.5527745'),
	date: Date.new(2016, 5, 6),
	value_brl: BigDecimal('42393733.38'),
	exchange_rate: BigDecimal('21.33795804'),
	transaction_info: withdraw,
	start_balance: BigDecimal('5433546.93772')

)

puts Date.new(2016, 6, 27)

TransactionItem.create!(
	value: BigDecimal('383515.163323288'),
	date: Date.new(2016, 6, 27),
	value_brl: BigDecimal('8207278.03'),
	exchange_rate: BigDecimal('21.40013959'),
	transaction_info: withdraw,
	start_balance: BigDecimal('7420322.49050')
)

puts Date.new(2016, 7, 29)

TransactionItem.create!(
	value: BigDecimal('611973.657811069'),
	date: Date.new(2016, 7, 29),
	value_brl: BigDecimal('13121407.28'),
	exchange_rate: BigDecimal('21.44113086'),
	transaction_info: withdraw,
	start_balance: BigDecimal('7803837.65382')
)

puts Date.new(2016, 8, 30)

TransactionItem.create!(
	value: BigDecimal('573211.706951141'),
	date: Date.new(2016, 8, 30),
	value_brl: BigDecimal('12319813.16'),
	exchange_rate: BigDecimal('21.49260563'),
	transaction_info: withdraw,
	start_balance: BigDecimal('8415811.31163')
)

puts Date.new(2016, 9, 30)

TransactionItem.create!(
	value: BigDecimal('577590.254823738'),
	date: Date.new(2016, 9, 30),
	value_brl: BigDecimal('12435287.93'),
	exchange_rate: BigDecimal('21.52960135'),
	transaction_info: withdraw,
	start_balance: BigDecimal('8989023.01858')
)

puts Date.new(2016, 10, 28)
 
TransactionItem.create!(
	value: BigDecimal('508924.2218972'),
	date: Date.new(2016, 10, 28),
	value_brl: BigDecimal('10973544.54'),
	exchange_rate: BigDecimal('21,56223671'),
	transaction_info: withdraw,
	start_balance: BigDecimal('9566613.27341')
)

puts Date.new(2016, 11, 30)

TransactionItem.create!(
	value: BigDecimal('715325.306302176'),
	date: Date.new(2016, 11, 30),
	value_brl: BigDecimal('15447408.00'),
	exchange_rate: BigDecimal('21.59494130'),
	transaction_info: withdraw,
	start_balance: BigDecimal('10075537.49531')
)

puts Date.new(2016, 12, 22)

TransactionItem.create!(
	value: BigDecimal('550758.880241646'),
	date: Date.new(2016, 12, 22),
	value_brl: BigDecimal('11909445.03'),
	exchange_rate: BigDecimal('21.62370042'),
	transaction_info: withdraw,
	start_balance: BigDecimal('10790862.80161')
)

puts Date.new(2017, 1, 31)

TransactionItem.create!(
	value: BigDecimal('270839.770669423'),
	date: Date.new(2017, 1, 31),
	value_brl: BigDecimal('5869510.23'),
	exchange_rate: BigDecimal('21.67152267'),
	transaction_info: withdraw,
	start_balance: BigDecimal('11341621.68185')
)

puts Date.new(2017, 3, 2)
  
TransactionItem.create!(
	value: BigDecimal('286313.741213063'),
	date: Date.new(2017, 3, 2),
	value_brl: BigDecimal('6207267.82'),
	exchange_rate: BigDecimal('21.67995079'),
	transaction_info: withdraw,
	start_balance: BigDecimal('11612461.45252')
)

puts Date.new(2017, 5, 2)

TransactionItem.create!(
	value: BigDecimal('109984.5161992'),
	date: Date.new(2017, 5, 2),
	value_brl: BigDecimal('2388057.81'),
	exchange_rate: BigDecimal('21.71267277'),
	transaction_info: withdraw,
	start_balance: BigDecimal('11898775.19373')
)

puts Date.new(2017, 6, 30)

TransactionItem.create!(
	value: BigDecimal('295191.232075548'),
	date: Date.new(2017, 6, 30),
	value_brl: BigDecimal('6417561.70'),
	exchange_rate: BigDecimal('21.74035338'),
	transaction_info: withdraw,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 9, 18)

TransactionItem.create!(
	value: BigDecimal('351624.161135471'),
	date: Date.new(2017, 9, 18),
	value_brl: BigDecimal('7653284.73'),
	exchange_rate: BigDecimal('21.76552574'),
	transaction_info: withdraw,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 11, 13)

TransactionItem.create!(
	value: BigDecimal('252538.2031043'),
	date: Date.new(2017, 11, 13),
	value_brl: BigDecimal('5496626.76'),
	exchange_rate: BigDecimal('21,76552574'),
	transaction_info: withdraw,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2018, 2, 15)

TransactionItem.create!(
	value: BigDecimal('288019.18248541'),
	date: Date.new(2018, 2, 15),
	value_brl: BigDecimal('5496626.76'),
	exchange_rate: BigDecimal('1'),
	transaction_info: withdraw,
	start_balance: BigDecimal('12852099.28790')
)

puts Date.new(2018, 10, 31)

TransactionItem.create!(
	value: BigDecimal('208970.05587'),
	date: Date.new(2018, 10, 31),
	value_brl: BigDecimal('5496626.76'),
	exchange_rate: BigDecimal('1'),
	transaction_info: withdraw,
	start_balance: BigDecimal('12905242.14372')
)

puts "Juros"
puts Date.new(2015, 05, 15)

TransactionItem.create!(
	value: BigDecimal('191.33589'),
	date: Date.new(2015, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('20.91152155'),
	transaction_info: interest,
	start_balance: BigDecimal('0')
)

puts Date.new(2015, 06, 15)

TransactionItem.create!(
	value: BigDecimal('692.22741'),
	date: Date.new(2015, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('38267.17717')
)

puts Date.new(2015, 07, 15)

TransactionItem.create!(
	value: BigDecimal('2039.49798'),
	date: Date.new(2015, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('138445.48117')
)

puts Date.new(2015, 8, 15)

TransactionItem.create!(
	value: BigDecimal('2903.55604'),
	date: Date.new(2015, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('407899.59501')
)

puts Date.new(2015, 9, 15)

TransactionItem.create!(
	value: BigDecimal('4844.74678'),
	date: Date.new(2015, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('580711.20741')
)

puts Date.new(2015, 10, 15)

TransactionItem.create!(
	value: BigDecimal('5745.95346'),
	date: Date.new(2015, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('968949.35625')
)

puts Date.new(2015, 11, 15)

TransactionItem.create!(
	value: BigDecimal('9626.70114'),
	date: Date.new(2015, 11, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('1149190.69172')
)

puts Date.new(2015, 12, 15)

TransactionItem.create!(
	value: BigDecimal('19765.89711'),
	date: Date.new(2015, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('1925340.22851')
)

puts Date.new(2016, 01, 15)

TransactionItem.create!(
	value: BigDecimal('19765.89711'),
	date: Date.new(2016, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 02, 15)

TransactionItem.create!(
	value: BigDecimal('19765.89711'),
	date: Date.new(2016, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 03, 15)

TransactionItem.create!(
	value: BigDecimal('19765.89711'),
	date: Date.new(2016, 3, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 04, 15)

TransactionItem.create!(
	value: BigDecimal('27167.73469'),
	date: Date.new(2016, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('5433546.93772')
)

puts Date.new(2016, 05, 15)

TransactionItem.create!(
	value: BigDecimal('27167.73469'),
	date: Date.new(2016, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('5433546.93772')
)

puts Date.new(2016, 06, 15)

TransactionItem.create!(
	value: BigDecimal('37101.61245'),
	date: Date.new(2016, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('7420322.49050')
)

puts Date.new(2016, 07, 15)

TransactionItem.create!(
	value: BigDecimal('39019.18827'),
	date: Date.new(2016, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('7803837.65382')
)

puts Date.new(2016, 8, 15)

TransactionItem.create!(
	value: BigDecimal('42079.05656'),
	date: Date.new(2016, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('8415811.31163')
)

puts Date.new(2016, 9, 15)

TransactionItem.create!(
	value: BigDecimal('44945.11509'),
	date: Date.new(2016, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('8989023.01858')
)

puts Date.new(2016, 10, 15)

TransactionItem.create!(
	value: BigDecimal('47833.06637'),
	date: Date.new(2016, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('9566613.27341')
)

puts Date.new(2016, 11, 15)

TransactionItem.create!(
	value: BigDecimal('50377.68748'),
	date: Date.new(2016, 11, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('10075537.49531')
)

puts Date.new(2016, 12, 15)

TransactionItem.create!(
	value: BigDecimal('53954.31401'),
	date: Date.new(2016, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('10790862.80161')
)

puts Date.new(2017, 01, 15)

TransactionItem.create!(
	value: BigDecimal('56708.10841'),
	date: Date.new(2017, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('11341621.68185')
)

puts Date.new(2017, 02, 15)

TransactionItem.create!(
	value: BigDecimal('58062.30726'),
	date: Date.new(2017, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('11612461.45252')
)

puts Date.new(2017, 03, 15)

TransactionItem.create!(
	value: BigDecimal('59493.87597'),
	date: Date.new(2017, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('11898775.19373')
)

puts Date.new(2017, 04, 15)

TransactionItem.create!(
	value: BigDecimal('60043.79855'),
	date: Date.new(2017, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 05, 15)

TransactionItem.create!(
	value: BigDecimal('60043.79855'),
	date: Date.new(2017, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 06, 15)

TransactionItem.create!(
	value: BigDecimal('60043.79855'),
	date: Date.new(2017, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 07, 17)

TransactionItem.create!(
	value: BigDecimal('61519.75471'),
	date: Date.new(2017, 07, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 8, 15)

TransactionItem.create!(
	value: BigDecimal('61519.75471'),
	date: Date.new(2017, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 9, 15)

TransactionItem.create!(
	value: BigDecimal('61519.75471'),
	date: Date.new(2017, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 10, 16)

TransactionItem.create!(
	value: BigDecimal('63277.87552'),
	date: Date.new(2017, 10, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2017, 11, 16)

TransactionItem.create!(
	value: BigDecimal('63277.87552'),
	date: Date.new(2017, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2017, 12, 15)

TransactionItem.create!(
	value: BigDecimal('64540.566531229700'),
	date: Date.new(2017, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12908113.30625')
)

puts Date.new(2018, 01, 15)

TransactionItem.create!(
	value: BigDecimal('64400.88069993820'),
	date: Date.new(2018, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12880176.13999')
)

puts Date.new(2018, 02, 15)

TransactionItem.create!(
	value: BigDecimal('64740.52841028160'),
	date: Date.new(2018, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12852099.28790')
)

puts Date.new(2018, 03, 15)

TransactionItem.create!(
	value: BigDecimal('65556.34438890120'),
	date: Date.new(2018, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13111268.87778')
)

puts Date.new(2018, 04, 15)

TransactionItem.create!(
	value: BigDecimal('65411.37518607240'),
	date: Date.new(2018, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13082275.03721')
)

puts Date.new(2018, 05, 15)

TransactionItem.create!(
	value: BigDecimal('65265.68113722940'),
	date: Date.new(2018, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13053136.22745')
)

puts Date.new(2018, 06, 15)

TransactionItem.create!(
	value: BigDecimal('65119.25861814230'),
	date: Date.new(2018, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13023851.72363')
)

puts Date.new(2018, 07, 16)

TransactionItem.create!(
	value: BigDecimal('64972.10399'),
	date: Date.new(2018, 07, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12994420.79729')
)

puts Date.new(2018, 8, 15)

TransactionItem.create!(
	value: BigDecimal('64824.21358'),
	date: Date.new(2018, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12964842.71632')
)

puts Date.new(2018, 9, 17)

TransactionItem.create!(
	value: BigDecimal('64675.58372'),
	date: Date.new(2018, 9, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12935116.74495')
)

puts Date.new(2018, 10, 15)

TransactionItem.create!(
	value: BigDecimal('64526.21072'),
	date: Date.new(2018, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12905242.14372')
)

puts Date.new(2018, 11, 16)

TransactionItem.create!(
	value: BigDecimal('64863.68764'),
	date: Date.new(2018, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13084188.22536')
)

puts Date.new(2018, 12, 15)

TransactionItem.create!(
	value: BigDecimal('65267.62197'),
	date: Date.new(2018, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13053524.39336')
)

puts Date.new(2019, 01, 15)

TransactionItem.create!(
	value: BigDecimal('65113.53621'),
	date: Date.new(2019, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13022707.24221')
)

puts Date.new(2019, 02, 15)

TransactionItem.create!(
	value: BigDecimal('64958.68003'),
	date: Date.new(2019, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12991736.00530')
)

puts Date.new(2019, 03, 15)

TransactionItem.create!(
	value: BigDecimal('64803.04956'),
	date: Date.new(2019, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12960609.91221')
)

puts Date.new(2019, 04, 15)

TransactionItem.create!(
	value: BigDecimal('64646.64094'),
	date: Date.new(2019, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12929328.18865')
)

puts Date.new(2019, 05, 15)

TransactionItem.create!(
	value: BigDecimal('64489.45028'),
	date: Date.new(2019, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12897890.05647')
)

puts Date.new(2019, 06, 15)

TransactionItem.create!(
	value: BigDecimal('64331.47367'),
	date: Date.new(2019, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('12866294.73363')
)

puts Date.new(2019, 07, 15)

TransactionItem.create!(
	value: BigDecimal('65456.84928'),
	date: Date.new(2019, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: interest,
	start_balance: BigDecimal('13091369.85527')
)

puts "Taxa Administrativa"
puts Date.new(2015, 05, 15)

TransactionItem.create!(
	value: BigDecimal('63.77863'),
	date: Date.new(2015, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('0')
)

puts Date.new(2015, 06, 15)

TransactionItem.create!(
	value: BigDecimal('230.74247'),
	date: Date.new(2015, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('38267.17717')
)

puts Date.new(2015, 07, 15)

TransactionItem.create!(
	value: BigDecimal('679.83266'),
	date: Date.new(2015, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('138445.48117')
)

puts Date.new(2015, 8, 15)

TransactionItem.create!(
	value: BigDecimal('967.85201'),
	date: Date.new(2015, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('407899.59501')
)

puts Date.new(2015, 9, 15)

TransactionItem.create!(
	value: BigDecimal('1614.91559'),
	date: Date.new(2015, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('580711.20741')
)

puts Date.new(2015, 10, 15)

TransactionItem.create!(
	value: BigDecimal('1915.31782'),
	date: Date.new(2015, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('968949.35625')
)

puts Date.new(2015, 11, 15)

TransactionItem.create!(
	value: BigDecimal('3208.90038'),
	date: Date.new(2015, 11, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('1149190.69172')
)

puts Date.new(2015, 12, 15)

TransactionItem.create!(
	value: BigDecimal('6588.63237'),
	date: Date.new(2015, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('1925340.22851')
)

puts Date.new(2016, 01, 15)

TransactionItem.create!(
	value: BigDecimal('6588.63237'),
	date: Date.new(2016, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 02, 15)

TransactionItem.create!(
	value: BigDecimal('6588.63237'),
	date: Date.new(2016, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 03, 15)

TransactionItem.create!(
	value: BigDecimal('6588.63237'),
	date: Date.new(2016, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 04, 15)

TransactionItem.create!(
	value: BigDecimal('9055.91156'),
	date: Date.new(2016, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('5433546.93772')
)

puts Date.new(2016, 05, 15)

TransactionItem.create!(
	value: BigDecimal('9055.91156'),
	date: Date.new(2016, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('5433546.93772')
)

puts Date.new(2016, 06, 15)

TransactionItem.create!(
	value: BigDecimal('12367.20415'),
	date: Date.new(2016, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('7420322.49050')
)

puts Date.new(2016, 07, 15)

TransactionItem.create!(
	value: BigDecimal('13006.39609'),
	date: Date.new(2016, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('7803837.65382')
)

puts Date.new(2016, 8, 15)

TransactionItem.create!(
	value: BigDecimal('14026.35219'),
	date: Date.new(2016, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('8415811.31163')
)

puts Date.new(2016, 9, 15)

TransactionItem.create!(
	value: BigDecimal('14981.70503'),
	date: Date.new(2016, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('8989023.01858')
)

puts Date.new(2016, 10, 15)

TransactionItem.create!(
	value: BigDecimal('15944.35546'),
	date: Date.new(2016, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('9566613.27341')
)

puts Date.new(2016, 11, 15)

TransactionItem.create!(
	value: BigDecimal('16792.56249'),
	date: Date.new(2016, 11, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('10075537.49531')
)

puts Date.new(2016, 12, 15)

TransactionItem.create!(
	value: BigDecimal('17984.77134'),
	date: Date.new(2016, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('10790862.80161')
)

puts Date.new(2017, 01, 15)

TransactionItem.create!(
	value: BigDecimal('18902.70280'),
	date: Date.new(2017, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('11341621.68185')
)

puts Date.new(2017, 02, 15)

TransactionItem.create!(
	value: BigDecimal('19354.10242'),
	date: Date.new(2017, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('11612461.45252')
)

puts Date.new(2017, 03, 15)

TransactionItem.create!(
	value: BigDecimal('19831.29199'),
	date: Date.new(2017, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('11898775.19373')
)

puts Date.new(2017, 04, 15)

TransactionItem.create!(
	value: BigDecimal('20014.59952'),
	date: Date.new(2017, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 05, 15)

TransactionItem.create!(
	value: BigDecimal('20014.59952'),
	date: Date.new(2017, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 06, 15)

TransactionItem.create!(
	value: BigDecimal('20014.59952'),
	date: Date.new(2017, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 07, 17)

TransactionItem.create!(
	value: BigDecimal('20506.58490'),
	date: Date.new(2017, 07, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 8, 15)

TransactionItem.create!(
	value: BigDecimal('20506.58490'),
	date: Date.new(2017, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 9, 15)

TransactionItem.create!(
	value: BigDecimal('20506.58490'),
	date: Date.new(2017, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 10, 16)

TransactionItem.create!(
	value: BigDecimal('21092.62517'),
	date: Date.new(2017, 10, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2017, 11, 16)

TransactionItem.create!(
	value: BigDecimal('21092.62517'),
	date: Date.new(2017, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2017, 12, 15)

TransactionItem.create!(
	value: BigDecimal('21513.52218'),
	date: Date.new(2017, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12908113.30625')
)

puts Date.new(2018, 01, 15)

TransactionItem.create!(
	value: BigDecimal('21466.96023'),
	date: Date.new(2018, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12880176.13999')
)

puts Date.new(2018, 02, 15)

TransactionItem.create!(
	value: BigDecimal('21580.17614'),
	date: Date.new(2018, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12852099.28790')
)

puts Date.new(2018, 03, 15)

TransactionItem.create!(
	value: BigDecimal('21852.11480'),
	date: Date.new(2018, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13111268.87778')
)

puts Date.new(2018, 04, 15)

TransactionItem.create!(
	value: BigDecimal('21803.79173'),
	date: Date.new(2018, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13082275.03721')
)

puts Date.new(2018, 05, 15)

TransactionItem.create!(
	value: BigDecimal('21755.22705'),
	date: Date.new(2018, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13053136.22745')
)

puts Date.new(2018, 06, 15)

TransactionItem.create!(
	value: BigDecimal('21706.41954'),
	date: Date.new(2018, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13023851.72363')
)

puts Date.new(2018, 07, 16)

TransactionItem.create!(
	value: BigDecimal('21657.36800'),
	date: Date.new(2018, 07, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12994420.79729')
)

puts Date.new(2018, 8, 15)

TransactionItem.create!(
	value: BigDecimal('21608.07119'),
	date: Date.new(2018, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12964842.71632')
)

puts Date.new(2018, 9, 17)

TransactionItem.create!(
	value: BigDecimal('21558.52791'),
	date: Date.new(2018, 9, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12935116.74495')
)

puts Date.new(2018, 10, 15)

TransactionItem.create!(
	value: BigDecimal('21508.73691'),
	date: Date.new(2018, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12905242.14372')
)

puts Date.new(2018, 11, 16)

TransactionItem.create!(
	value: BigDecimal('21621.22921'),
	date: Date.new(2018, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13084188.22536')
)

puts Date.new(2018, 12, 15)

TransactionItem.create!(
	value: BigDecimal('21755.87399'),
	date: Date.new(2018, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13053524.39336')
)

puts Date.new(2019, 01, 15)

TransactionItem.create!(
	value: BigDecimal('21704.51207'),
	date: Date.new(2019, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13022707.24221')
)

puts Date.new(2019, 02, 15)

TransactionItem.create!(
	value: BigDecimal('21652.89334'),
	date: Date.new(2019, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12991736.00530')
)

puts Date.new(2019, 03, 15)

TransactionItem.create!(
	value: BigDecimal('21601.01652'),
	date: Date.new(2019, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12960609.91221')
)

puts Date.new(2019, 04, 15)

TransactionItem.create!(
	value: BigDecimal('21548.88031'),
	date: Date.new(2019, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12929328.18865')
)

puts Date.new(2019, 05, 15)

TransactionItem.create!(
	value: BigDecimal('21496.48343'),
	date: Date.new(2019, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12897890.05647')
)

puts Date.new(2019, 06, 15)

TransactionItem.create!(
	value: BigDecimal('21443.82456'),
	date: Date.new(2019, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('12866294.73363')
)

puts Date.new(2019, 07, 15)

TransactionItem.create!(
	value: BigDecimal('21818.94976'),
	date: Date.new(2019, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_adm,
	start_balance: BigDecimal('13091369.85527')
)


puts "Taxa de Risco"
puts Date.new(2015, 05, 15)

TransactionItem.create!(
	value: BigDecimal('22.32252'),
	date: Date.new(2015, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('0')
)

puts Date.new(2015, 06, 15)

TransactionItem.create!(
	value: BigDecimal('80.75986'),
	date: Date.new(2015, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('38267.17717')
)

puts Date.new(2015, 07, 15)

TransactionItem.create!(
	value: BigDecimal('237.94143'),
	date: Date.new(2015, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('138445.48117')
)

puts Date.new(2015, 8, 15)

TransactionItem.create!(
	value: BigDecimal('338.74820'),
	date: Date.new(2015, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('407899.59501')
)

puts Date.new(2015, 9, 15)

TransactionItem.create!(
	value: BigDecimal('565.22046'),
	date: Date.new(2015, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('580711.20741')
)

puts Date.new(2015, 10, 15)

TransactionItem.create!(
	value: BigDecimal('670.36124'),
	date: Date.new(2015, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('968949.35625')
)

puts Date.new(2015, 11, 15)

TransactionItem.create!(
	value: BigDecimal('1123.11513'),
	date: Date.new(2015, 11, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('1149190.69172')
)

puts Date.new(2015, 12, 15)

TransactionItem.create!(
	value: BigDecimal('2306.02133'),
	date: Date.new(2015, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('1925340.22851')
)

puts Date.new(2016, 01, 15)

TransactionItem.create!(
	value: BigDecimal('2306.02133'),
	date: Date.new(2016, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 02, 15)

TransactionItem.create!(
	value: BigDecimal('2306.02133'),
	date: Date.new(2016, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 03, 15)

TransactionItem.create!(
	value: BigDecimal('2306.02133'),
	date: Date.new(2016, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('3953179.42250')
)

puts Date.new(2016, 04, 15)

TransactionItem.create!(
	value: BigDecimal('3169.56905'),
	date: Date.new(2016, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('5433546.93772')
)

puts Date.new(2016, 05, 15)

TransactionItem.create!(
	value: BigDecimal('3169.56905'),
	date: Date.new(2016, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('5433546.93772')
)

puts Date.new(2016, 06, 15)

TransactionItem.create!(
	value: BigDecimal('4328.52145'),
	date: Date.new(2016, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('7420322.49050')
)

puts Date.new(2016, 07, 15)

TransactionItem.create!(
	value: BigDecimal('4552.23863'),
	date: Date.new(2016, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('7803837.65382')
)

puts Date.new(2016, 8, 15)

TransactionItem.create!(
	value: BigDecimal('4909.22327'),
	date: Date.new(2016, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('8415811.31163')
)

puts Date.new(2016, 9, 15)

TransactionItem.create!(
	value: BigDecimal('5243.59676'),
	date: Date.new(2016, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('8989023.01858')
)

puts Date.new(2016, 10, 15)

TransactionItem.create!(
	value: BigDecimal('5580.52441'),
	date: Date.new(2016, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('9566613.27341')
)

puts Date.new(2016, 11, 15)

TransactionItem.create!(
	value: BigDecimal('5877.39687'),
	date: Date.new(2016, 11, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('10075537.49531')
)

puts Date.new(2016, 12, 15)

TransactionItem.create!(
	value: BigDecimal('6294.66997'),
	date: Date.new(2016, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('10790862.80161')
)

puts Date.new(2017, 01, 15)

TransactionItem.create!(
	value: BigDecimal('6615.94598'),
	date: Date.new(2017, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('11341621.68185')
)

puts Date.new(2017, 02, 15)

TransactionItem.create!(
	value: BigDecimal('6773.93585'),
	date: Date.new(2017, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('11612461.45252')
)

puts Date.new(2017, 03, 15)

TransactionItem.create!(
	value: BigDecimal('6940.95220'),
	date: Date.new(2017, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('11898775.19373')
)

puts Date.new(2017, 04, 15)

TransactionItem.create!(
	value: BigDecimal('7005.10983'),
	date: Date.new(2017, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 05, 15)

TransactionItem.create!(
	value: BigDecimal('7005.10983'),
	date: Date.new(2017, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 06, 15)

TransactionItem.create!(
	value: BigDecimal('7005.10983'),
	date: Date.new(2017, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12008759.70993')
)

puts Date.new(2017, 07, 17)

TransactionItem.create!(
	value: BigDecimal('7177.30472'),
	date: Date.new(2017, 07, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 8, 15)

TransactionItem.create!(
	value: BigDecimal('7177.30472'),
	date: Date.new(2017, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 9, 15)

TransactionItem.create!(
	value: BigDecimal('7177.30472'),
	date: Date.new(2017, 9, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12303950.94201')
)

puts Date.new(2017, 10, 16)

TransactionItem.create!(
	value: BigDecimal('7382.41881'),
	date: Date.new(2017, 10, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2017, 11, 16)

TransactionItem.create!(
	value: BigDecimal('7382.41881'),
	date: Date.new(2017, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12655575.10314')
)

puts Date.new(2017, 12, 15)

TransactionItem.create!(
	value: BigDecimal('7529.73276'),
	date: Date.new(2017, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12908113.30625')
)

puts Date.new(2018, 01, 15)

TransactionItem.create!(
	value: BigDecimal('7513.43608'),
	date: Date.new(2018, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12880176.13999')
)

puts Date.new(2018, 02, 15)

TransactionItem.create!(
	value: BigDecimal('7665.06911'),
	date: Date.new(2018, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12852099.28790')
)

puts Date.new(2018, 03, 15)

TransactionItem.create!(
	value: BigDecimal('7648.24018'),
	date: Date.new(2018, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13111268.87778')
)

puts Date.new(2018, 04, 15)

TransactionItem.create!(
	value: BigDecimal('7631.32711'),
	date: Date.new(2018, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13082275.03721')
)

puts Date.new(2018, 05, 15)

TransactionItem.create!(
	value: BigDecimal('7614.32947'),
	date: Date.new(2018, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13053136.22745')
)

puts Date.new(2018, 06, 15)

TransactionItem.create!(
	value: BigDecimal('7597.24684'),
	date: Date.new(2018, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13023851.72363')
)

puts Date.new(2018, 07, 16)

TransactionItem.create!(
	value: BigDecimal('7580.07880'),
	date: Date.new(2018, 07, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12994420.79729')
)

puts Date.new(2018, 8, 15)

TransactionItem.create!(
	value: BigDecimal('7562.82492'),
	date: Date.new(2018, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12964842.71632')
)

puts Date.new(2018, 9, 17)

TransactionItem.create!(
	value: BigDecimal('7545.48477'),
	date: Date.new(2018, 9, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12935116.74495')
)

puts Date.new(2018, 10, 15)

TransactionItem.create!(
	value: BigDecimal('7528.05792'),
	date: Date.new(2018, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12905242.14372')
)

puts Date.new(2018, 11, 16)

TransactionItem.create!(
	value: BigDecimal('7632.44313'),
	date: Date.new(2018, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13084188.22536')
)

puts Date.new(2018, 12, 15)

TransactionItem.create!(
	value: BigDecimal('7614.55590'),
	date: Date.new(2018, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13053524.39336')
)

puts Date.new(2019, 01, 15)

TransactionItem.create!(
	value: BigDecimal('7596.57922'),
	date: Date.new(2019, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13022707.24221')
)

puts Date.new(2019, 02, 15)

TransactionItem.create!(
	value: BigDecimal('7578.51267'),
	date: Date.new(2019, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12991736.00530')
)

puts Date.new(2019, 03, 15)

TransactionItem.create!(
	value: BigDecimal('7560.35578'),
	date: Date.new(2019, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12960609.91221')
)

puts Date.new(2019, 04, 15)

TransactionItem.create!(
	value: BigDecimal('7542.10811'),
	date: Date.new(2019, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12929328.18865')
)

puts Date.new(2019, 05, 15)

TransactionItem.create!(
	value: BigDecimal('7523.76920'),
	date: Date.new(2019, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12897890.05647')
)

puts Date.new(2019, 06, 15)

TransactionItem.create!(
	value: BigDecimal('7505.33859'),
	date: Date.new(2019, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('12866294.73363')
)

puts Date.new(2019, 07, 15)

TransactionItem.create!(
	value: BigDecimal('7636.63242'),
	date: Date.new(2019, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: charges_risc,
	start_balance: BigDecimal('13091369.85527')
)

puts "Amortização"

puts Date.new(2017, 12, 15)

TransactionItem.create!(
	value: BigDecimal('27937.166258268900'),
	date: Date.new(2017, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12908113.30625')
)

puts Date.new(2018, 01, 15)

TransactionItem.create!(
	value: BigDecimal('28076.85209006160'),
	date: Date.new(2018, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12880176.13999')
)

puts Date.new(2018, 02, 15)

TransactionItem.create!(
	value: BigDecimal('28849.59260274620'),
	date: Date.new(2018, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12852099.28790')
)

puts Date.new(2018, 03, 15)

TransactionItem.create!(
	value: BigDecimal('28993.84056575990'),
	date: Date.new(2018, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13111268.87778')
)

puts Date.new(2018, 04, 15)

TransactionItem.create!(
	value: BigDecimal('29138.80976858870'),
	date: Date.new(2018, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13082275.03721')
)

puts Date.new(2018, 05, 15)

TransactionItem.create!(
	value: BigDecimal('29284.50381743160'),
	date: Date.new(2018, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13053136.22745')
)

puts Date.new(2018, 06, 15)

TransactionItem.create!(
	value: BigDecimal('29430.92633651880'),
	date: Date.new(2018, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13023851.72363')
)

puts Date.new(2018, 07, 16)

TransactionItem.create!(
	value: BigDecimal('29578.08097'),
	date: Date.new(2018, 07, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12994420.79729')
)

puts Date.new(2018, 8, 15)

TransactionItem.create!(
	value: BigDecimal('29725.97137'),
	date: Date.new(2018, 8, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12964842.71632')
)

puts Date.new(2018, 9, 17)

TransactionItem.create!(
	value: BigDecimal('29874.60123'),
	date: Date.new(2018, 9, 17),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12935116.74495')
)

puts Date.new(2018, 10, 15)

TransactionItem.create!(
	value: BigDecimal('30023.97424'),
	date: Date.new(2018, 10, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12905242.14372')
)

puts Date.new(2018, 11, 16)

TransactionItem.create!(
	value: BigDecimal('30663.83199'),
	date: Date.new(2018, 11, 16),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13084188.22536')
)

puts Date.new(2018, 12, 15)

TransactionItem.create!(
	value: BigDecimal('30817.15115'),
	date: Date.new(2018, 12, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13053524.39336')
)

puts Date.new(2019, 01, 15)

TransactionItem.create!(
	value: BigDecimal('30971.236912'),
	date: Date.new(2019, 01, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13022707.24221')
)

puts Date.new(2019, 02, 15)

TransactionItem.create!(
	value: BigDecimal('31126.09309'),
	date: Date.new(2019, 02, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12991736.00530')
)

puts Date.new(2019, 03, 15)

TransactionItem.create!(
	value: BigDecimal('31281.72356'),
	date: Date.new(2019, 03, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12960609.91221')
)

puts Date.new(2019, 04, 15)

TransactionItem.create!(
	value: BigDecimal('31438.13218'),
	date: Date.new(2019, 04, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12929328.18865')
)

puts Date.new(2019, 05, 15)

TransactionItem.create!(
	value: BigDecimal('31595.32284'),
	date: Date.new(2019, 05, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12897890.05647')
)

puts Date.new(2019, 06, 15)

TransactionItem.create!(
	value: BigDecimal('31753.29945'),
	date: Date.new(2019, 06, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('12866294.73363')
)

puts Date.new(2019, 07, 15)

TransactionItem.create!(
	value: BigDecimal('32550.64938'),
	date: Date.new(2019, 07, 15),
	value_brl: BigDecimal('1'),
	exchange_rate: BigDecimal('1'),
	transaction_info: amortization,
	start_balance: BigDecimal('13091369.85527')
)