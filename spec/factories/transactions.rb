FactoryBot.define do
	sequence :date_2019 do |n|				
  	Date.new(2019, n, n)
	end

	factory :transaction do
		value { Faker::Number.number(6) }		
		exchange_rate { 0.5 }
		type { 'Withdraw' }
		debt
		factory :transaction_2019 do
			date { generate(:date_2019) }
		end

		factory :transaction_2018 do
			date { Date.new(2018, 12, 31) }			
		end

		factory :withdraw do
			type { 'Withdraw' }

 			factory :withdraw_0515 do
 				value { BigDecimal('38267.177167698700000') }
 				date { Date.new(2015, 5, 15) }
				start_outstanding_balance { BigDecimal('0') }
 			end

 			factory :withdraw_0615 do
 				value { BigDecimal('100178.304001591000000') }
 				date { Date.new(2015, 6, 15) }
				start_outstanding_balance { BigDecimal('38267.177167698700000') }
 			end

 			factory :withdraw_0715 do
 				value { BigDecimal('269454.113840257000000') }
 				date { Date.new(2015, 7, 15) }
				start_outstanding_balance { BigDecimal('138445.481169290000000') }
 			end

 			factory :withdraw_0815 do
 				value { BigDecimal('172811.612402003000000') }
 				date { Date.new(2015, 8 ,15) }
				start_outstanding_balance { BigDecimal('407899.595009547000000') }
 			end

 			factory :withdraw_0915 do
 				value { BigDecimal('388238.148837079000000') }
 				date { Date.new(2015, 9, 15) }
				start_outstanding_balance { BigDecimal('580711.207411550000000') }
 			end

 			factory :withdraw_1015 do
 				value { BigDecimal('180241.335471127000000') }
 				date { Date.new(2015, 10, 15) }
				start_outstanding_balance { BigDecimal('968949.356248629000000') }
 			end

 			factory :withdraw_1115 do
 				value { BigDecimal('776149.536786542000000') }
 				date { Date.new(2015, 11, 15) }
				start_outstanding_balance { BigDecimal('1149190.691719760000000') }
 			end

 			factory :withdraw_1215 do
 				value { BigDecimal('2027839.193996590000000') }
 				date { Date.new(2015, 12, 15) }
				start_outstanding_balance { BigDecimal('1925340.228506300000000') }
 			end

 			factory :withdraw_0316 do
 				value { BigDecimal('1480367.515221290000000') }
 				date { Date.new(2016, 3, 15) }
				start_outstanding_balance { BigDecimal('3953179.422502890000000') }
 			end

 			factory :withdraw_0516 do
 				value { BigDecimal('1986775.552774500000000') }
 				date { Date.new(2016, 5, 15) }
				start_outstanding_balance { BigDecimal('5433546.937724170000000') }
 			end

 			factory :withdraw_0616 do
 				value { BigDecimal('383515.163323288000000') }
 				date { Date.new(2016, 6, 15) }
				start_outstanding_balance { BigDecimal('7420322.490498670000000') }
 			end

 			factory :withdraw_0716 do
 				value { BigDecimal('611973.657811069000000') }
 				date { Date.new(2016, 7, 15) }
				start_outstanding_balance { BigDecimal('7803837.653821960000000') }
 			end

 			factory :withdraw_0816 do
 				value { BigDecimal('573211.706951141000000') }
 				date { Date.new(2016, 8, 15) }
				start_outstanding_balance { BigDecimal('8415811.311633030000000') }
 			end

 			factory :withdraw_0916 do
 				value { BigDecimal('577590.254823738000000') }
 				date { Date.new(2016, 9, 15) }
				start_outstanding_balance { BigDecimal('8989023.018584170000000') }
 			end

 			factory :withdraw_1016 do
 				value { BigDecimal('508924.221897200000000') }
 				date { Date.new(2016, 10, 15) }
				start_outstanding_balance { BigDecimal('9566613.273407910000000') }
 			end

 			factory :withdraw_1116 do
 				value { BigDecimal('715325.306302176000000') }
 				date { Date.new(2016, 11, 15) }
				start_outstanding_balance { BigDecimal('10075537.495305100000000') }
 			end

 			factory :withdraw_1216 do
 				value { BigDecimal('550758.880241646000000') }
 				date { Date.new(2016, 12, 15) }
				start_outstanding_balance { BigDecimal('10790862.801607300000000') }
 			end

 			factory :withdraw_0117 do
 				value { BigDecimal('270839.770669423000000') }
 				date { Date.new(2017, 1, 15) }
				start_outstanding_balance { BigDecimal('11341621.681848900000000') }
 			end

 			factory :withdraw_0217 do
 				value { BigDecimal('286313.741213063000000') }
 				date { Date.new(2017, 2, 15) }
				start_outstanding_balance { BigDecimal('11612461.452518400000000') }
 			end

 			factory :withdraw_0317 do
 				value { BigDecimal('109984.516199200000000') }
 				date { Date.new(2017, 3, 15) }
				start_outstanding_balance { BigDecimal('11898775.193731400000000') }
 			end

 			factory :withdraw_0617 do
 				value { BigDecimal('295191.232075548000000') }
 				date { Date.new(2017, 6, 15) }
				start_outstanding_balance { BigDecimal('12008759.709930600000000') }
 			end

 			factory :withdraw_0917 do
 				value { BigDecimal('351624.161135471000000') }
 				date { Date.new(2017, 9, 18) }
				start_outstanding_balance { BigDecimal('12303950.942006200000000') }
 			end

 			factory :withdraw_1117 do
 				value { BigDecimal('252538.203104300000000') }
 				date { Date.new(2017, 11, 13) }
				start_outstanding_balance { BigDecimal('12655575.103141600000000') }
 			end

			factory :withdraw_0218 do
				value { BigDecimal('288019.182490000000') }
				date { Date.new(2018,2,15) }
				start_outstanding_balance { BigDecimal('12852099.287897100000') }
			end

			factory :withdraw_1018 do
				value { BigDecimal('208970.055870000000') }
				date { Date.new(2018,10,31) }
				start_outstanding_balance { BigDecimal('12905242.143724800000') }
			end
		end

		factory :payment do
			type { 'Payment' }
		
			factory :payment_1217 do
	 			principal { BigDecimal '27937.166258268900000' }
	 			date { Date.new(2017, 12, 15) }
				start_outstanding_balance { BigDecimal('12908113.306245900000000') }
	 		end
	 		
	 		factory :payment_0118 do	
	 			principal { BigDecimal '28076.8520795603000000' }
	 			date { Date.new(2018, 1, 15) }
				start_outstanding_balance { BigDecimal('12880176.139987200000') }
	 		end
	 		
	 		factory :payment_0218 do	
	 			principal { BigDecimal '28849.5926027782000000' }
	 			date { Date.new(2018, 2, 15) }
				start_outstanding_balance { BigDecimal('12852099.287907600000') }
	 		end
	 		
	 		factory :payment_0318 do	
	 			principal { BigDecimal '28993.8405657921000000' }
	 			date { Date.new(2018, 3, 15) }
				start_outstanding_balance { BigDecimal('13111268.877794800000') }
	 		end
	 		
	 		factory :payment_0418 do	
	 			principal { BigDecimal '29138.8097686210000000' }
	 			date { Date.new(2018, 4, 16) }
				start_outstanding_balance { BigDecimal('13082275.037229000000') }
	 		end
	 		
	 		factory :payment_0518 do	
	 			principal { BigDecimal '29284.5038174641000000' }
	 			date { Date.new(2018, 5, 15) }
				start_outstanding_balance { BigDecimal('13053136.227460400000') }
	 		end
	 		
	 		factory :payment_0618 do	
	 			principal { BigDecimal '29430.9263365514000000' }
	 			date { Date.new(2018, 6, 15) }
				start_outstanding_balance { BigDecimal('13023851.723643000000') }
	 		end
	 		
	 		factory :payment_0718 do	
	 			principal { BigDecimal '29578.0809682342000000' }
	 			date { Date.new(2018, 7, 16) }
				start_outstanding_balance { BigDecimal('12994420.797306400000') }
	 		end
	 		
	 		factory :payment_0818 do	
	 			principal { BigDecimal '29725.9713730754000000' }
	 			date { Date.new(2018, 8, 15) }
				start_outstanding_balance { BigDecimal('12964842.716338200000') }
	 		end
	 		
	 		factory :payment_0918 do	
	 			principal { BigDecimal '29874.6012299408000000' }
	 			date { Date.new(2018, 9, 17) }
				start_outstanding_balance { BigDecimal('12935116.744965100000') }
	 		end
	 		
	 		factory :payment_1018 do	
	 			principal { BigDecimal '30023.9742360904000000' }
	 			date { Date.new(2018, 10, 15) }
				start_outstanding_balance { BigDecimal('12905242.143735100000') }
	 		end
	 		
	 		factory :payment_1118 do	
	 			principal { BigDecimal '30663.8319935275000000' }
	 			date { Date.new(2018, 11, 16) }
				start_outstanding_balance { BigDecimal('13084188.225369100000') }
	 		end
	 		
	 		factory :payment_1218 do	
	 			principal { BigDecimal '30817.1511534962000000' }
	 			date { Date.new(2018, 12, 15) }
				start_outstanding_balance { BigDecimal('13053524.393375500000') }
	 		end
	 	end
	end
end