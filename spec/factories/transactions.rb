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
 				value { BigDecimal('38267.1771676987') }
 				date { Date.new(2015, 5, 15) }
				start_outstanding_balance { BigDecimal('0') }
 			end

 			factory :withdraw_0615 do
 				value { BigDecimal('100178.304001591') }
 				date { Date.new(2015, 6, 15) }
				start_outstanding_balance { BigDecimal('38267.1771676987') }
 			end

 			factory :withdraw_0715 do
 				value { BigDecimal('269454.113840257') }
 				date { Date.new(2015, 7, 15) }
				start_outstanding_balance { BigDecimal('138445.48116929') }
 			end

 			factory :withdraw_0815 do
 				value { BigDecimal('172811.612402003') }
 				date { Date.new(2015, 8 ,15) }
				start_outstanding_balance { BigDecimal('407899.595009547') }
 			end

 			factory :withdraw_0915 do
 				value { BigDecimal('388238.148837079') }
 				date { Date.new(2015, 9, 15) }
				start_outstanding_balance { BigDecimal('580711.20741155') }
 			end

 			factory :withdraw_1015 do
 				value { BigDecimal('180241.335471127') }
 				date { Date.new(2015, 10, 15) }
				start_outstanding_balance { BigDecimal('968949.356248629') }
 			end

 			factory :withdraw_1115 do
 				value { BigDecimal('776149.536786542') }
 				date { Date.new(2015, 11, 15) }
				start_outstanding_balance { BigDecimal('1149190.69171976') }
 			end

 			factory :withdraw_1215 do
 				value { BigDecimal('2027839.19399659') }
 				date { Date.new(2015, 12, 15) }
				start_outstanding_balance { BigDecimal('1925340.2285063') }
 			end

 			factory :withdraw_0316 do
 				value { BigDecimal('1480367.51522129') }
 				date { Date.new(2016, 3, 15) }
				start_outstanding_balance { BigDecimal('3953179.42250289') }
 			end

 			factory :withdraw_0516 do
 				value { BigDecimal('1986775.5527745') }
 				date { Date.new(2016, 5, 15) }
				start_outstanding_balance { BigDecimal('5433546.93772417') }
 			end

 			factory :withdraw_0616 do
 				value { BigDecimal('383515.163323288') }
 				date { Date.new(2016, 6, 15) }
				start_outstanding_balance { BigDecimal('7420322.49049867') }
 			end

 			factory :withdraw_0716 do
 				value { BigDecimal('611973.657811069') }
 				date { Date.new(2016, 7, 15) }
				start_outstanding_balance { BigDecimal('7803837.65382196') }
 			end

 			factory :withdraw_0816 do
 				value { BigDecimal('573211.706951141') }
 				date { Date.new(2016, 8, 15) }
				start_outstanding_balance { BigDecimal('8415811.31163303') }
 			end

 			factory :withdraw_0916 do
 				value { BigDecimal('577590.254823738') }
 				date { Date.new(2016, 9, 15) }
				start_outstanding_balance { BigDecimal('8989023.01858417') }
 			end

 			factory :withdraw_1016 do
 				value { BigDecimal('508924.2218972') }
 				date { Date.new(2016, 10, 15) }
				start_outstanding_balance { BigDecimal('9566613.27340791') }
 			end

 			factory :withdraw_1116 do
 				value { BigDecimal('715325.306302176') }
 				date { Date.new(2016, 11, 15) }
				start_outstanding_balance { BigDecimal('10075537.4953051') }
 			end

 			factory :withdraw_1216 do
 				value { BigDecimal('550758.880241646') }
 				date { Date.new(2016, 12, 15) }
				start_outstanding_balance { BigDecimal('10790862.8016073') }
 			end

 			factory :withdraw_0117 do
 				value { BigDecimal('270839.770669423') }
 				date { Date.new(2017, 1, 15) }
				start_outstanding_balance { BigDecimal('11341621.6818489') }
 			end

 			factory :withdraw_0217 do
 				value { BigDecimal('286313.741213063') }
 				date { Date.new(2017, 2, 15) }
				start_outstanding_balance { BigDecimal('11612461.4525184') }
 			end

 			factory :withdraw_0317 do
 				value { BigDecimal('109984.5161992') }
 				date { Date.new(2017, 3, 15) }
				start_outstanding_balance { BigDecimal('11898775.1937314') }
 			end

 			factory :withdraw_0617 do
 				value { BigDecimal('295191.232075548') }
 				date { Date.new(2017, 6, 15) }
				start_outstanding_balance { BigDecimal('12008759.7099306') }
 			end

 			factory :withdraw_0917 do
 				value { BigDecimal('351624.161135471') }
 				date { Date.new(2017, 9, 18) }
				start_outstanding_balance { BigDecimal('12303950.9420062') }
 			end

 			factory :withdraw_1117 do
 				value { BigDecimal('252538.2031043') }
 				date { Date.new(2017, 11, 13) }
				start_outstanding_balance { BigDecimal('12655575.1031416') }
 			end

			factory :withdraw_0218 do
				value { BigDecimal('288019.18249') }
				date { Date.new(2018,2,15) }
				start_outstanding_balance { BigDecimal('12852099.2878971') }
			end

			factory :withdraw_1018 do
				value { BigDecimal('208970.05587') }
				date { Date.new(2018,10,31) }
				start_outstanding_balance { BigDecimal('12905242.1437248') }
			end
		end

		factory :payment do
			type { 'Payment' }
		
			factory :payment_1217 do
	 			principal { BigDecimal '27937.1662582689' }
	 			date { Date.new(2017, 12, 15) }
				start_outstanding_balance { BigDecimal('12908113.3062459') }
	 		end
	 		
	 		factory :payment_0118 do	
	 			principal { BigDecimal '28076.8520795603' }
	 			date { Date.new(2018, 1, 15) }
				start_outstanding_balance { BigDecimal('12880176.1399872') }
	 		end
	 		
	 		factory :payment_0218 do	
	 			principal { BigDecimal '28849.5926027782' }
	 			date { Date.new(2018, 2, 15) }
				start_outstanding_balance { BigDecimal('12852099.2879076') }
	 		end
	 		
	 		factory :payment_0318 do	
	 			principal { BigDecimal '28993.8405657921' }
	 			date { Date.new(2018, 3, 15) }
				start_outstanding_balance { BigDecimal('13111268.8777948') }
	 		end
	 		
	 		factory :payment_0418 do	
	 			principal { BigDecimal '29138.809768621' }
	 			date { Date.new(2018, 4, 16) }
				start_outstanding_balance { BigDecimal('13082275.037229') }
	 		end
	 		
	 		factory :payment_0518 do	
	 			principal { BigDecimal '29284.5038174641' }
	 			date { Date.new(2018, 5, 15) }
				start_outstanding_balance { BigDecimal('13053136.2274604') }
	 		end
	 		
	 		factory :payment_0618 do	
	 			principal { BigDecimal '29430.9263365514' }
	 			date { Date.new(2018, 6, 15) }
				start_outstanding_balance { BigDecimal('13023851.723643') }
	 		end
	 		
	 		factory :payment_0718 do	
	 			principal { BigDecimal '29578.0809682342' }
	 			date { Date.new(2018, 7, 16) }
				start_outstanding_balance { BigDecimal('12994420.7973064') }
	 		end
	 		
	 		factory :payment_0818 do	
	 			principal { BigDecimal '29725.9713730754' }
	 			date { Date.new(2018, 8, 15) }
				start_outstanding_balance { BigDecimal('12964842.7163382') }
	 		end
	 		
	 		factory :payment_0918 do	
	 			principal { BigDecimal '29874.6012299408' }
	 			date { Date.new(2018, 9, 17) }
				start_outstanding_balance { BigDecimal('12935116.7449651') }
	 		end
	 		
	 		factory :payment_1018 do	
	 			principal { BigDecimal '30023.9742360904' }
	 			date { Date.new(2018, 10, 15) }
				start_outstanding_balance { BigDecimal('12905242.1437351') }
	 		end
	 		
	 		factory :payment_1118 do	
	 			principal { BigDecimal '30663.8319935275' }
	 			date { Date.new(2018, 11, 16) }
				start_outstanding_balance { BigDecimal('13084188.2253691') }
	 		end
	 		
	 		factory :payment_1218 do	
	 			principal { BigDecimal '30817.1511534962' }
	 			date { Date.new(2018, 12, 15) }
				start_outstanding_balance { BigDecimal('13053524.3933755') }
	 		end
	 	end
	end
end