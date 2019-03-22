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
 				date { Date.new(2015, 5, 8) }
 			end

 			factory :withdraw_0615 do
 				value { BigDecimal('100178.304001591') }
 				date { Date.new(2015, 6, 19) }
 			end

 			factory :withdraw_0715 do
 				value { BigDecimal('269454.113840257') }
 				date { Date.new(2015, 7, 24) }
 			end

 			factory :withdraw_0815 do
 				value { BigDecimal('172811.612402003') }
 				date { Date.new(2015, 8 ,21) }
 			end

 			factory :withdraw_0915 do
 				value { BigDecimal('388238.148837079') }
 				date { Date.new(2015, 9, 22) }
 			end

 			factory :withdraw_1015 do
 				value { BigDecimal('180241.335471127') }
 				date { Date.new(2015, 10, 22) }
 			end

 			factory :withdraw_1115 do
 				value { BigDecimal('776149.536786542') }
 				date { Date.new(2015, 11, 23) }
 			end

 			factory :withdraw_1215 do
 				value { BigDecimal('2027839.19399659') }
 				date { Date.new(2015, 12, 17) }
 			end

 			factory :withdraw_0316 do
 				value { BigDecimal('1480367.51522129') }
 				date { Date.new(2016, 3, 15) }
 			end

 			factory :withdraw_0516 do
 				value { BigDecimal('1986775.5527745') }
 				date { Date.new(2016, 5, 6) }
 			end

 			factory :withdraw_0616 do
 				value { BigDecimal('383515.163323288') }
 				date { Date.new(2016, 6, 27) }
 			end

 			factory :withdraw_0716 do
 				value { BigDecimal('611973.657811069') }
 				date { Date.new(2016, 7, 29) }
 			end

 			factory :withdraw_0816 do
 				value { BigDecimal('573211.706951141') }
 				date { Date.new(2016, 8, 30) }
 			end

 			factory :withdraw_0916 do
 				value { BigDecimal('577590.254823738') }
 				date { Date.new(2016, 9, 30) }
 			end

 			factory :withdraw_1016 do
 				value { BigDecimal('508924.2218972') }
 				date { Date.new(2016, 10, 28) }
 			end

 			factory :withdraw_1116 do
 				value { BigDecimal('715325.306302176') }
 				date { Date.new(2016, 11, 30) }
 			end

 			factory :withdraw_1216 do
 				value { BigDecimal('550758.880241646') }
 				date { Date.new(2016, 12, 22) }
 			end

 			factory :withdraw_0117 do
 				value { BigDecimal('270839.770669423') }
 				date { Date.new(2017, 1, 31) }
 			end

 			factory :withdraw_0217 do
 				value { BigDecimal('286313.741213063') }
 				date { Date.new(2017, 3, 2) }
 			end

 			factory :withdraw_0317 do
 				value { BigDecimal('109984.5161992') }
 				date { Date.new(2017, 5, 2) }
 			end

 			factory :withdraw_0617 do
 				value { BigDecimal('295191.232075548') }
 				date { Date.new(2017, 6, 30) }
 			end

 			factory :withdraw_0917 do
 				value { BigDecimal('351624.1611354710') }
 				date { Date.new(2017, 9, 18) }
 			end

 			factory :withdraw_1117 do
 				value { BigDecimal('252538.20310430') }
 				date { Date.new(2017, 11, 13) }
 			end

			factory :withdraw_0218 do
				value { BigDecimal('288019.182490') }
				date { Date.new(2018, 2 ,5) }
			end

			factory :withdraw_1018 do
				value { BigDecimal('208970.055870') }
				date { Date.new(2018, 10, 31) }
			end
		end

		factory :payment do
			type { 'Payment' }
		
			factory :payment_1217 do
	 			principal { BigDecimal '27937.1662582689' }
	 			date { Date.new(2017, 12, 15) }
	 		end
	 		
	 		factory :payment_0118 do	
	 			principal { BigDecimal '28076.8520795603' }
	 			date { Date.new(2018, 1, 15) }
	 		end
	 		
	 		factory :payment_0218 do	
	 			principal { BigDecimal '28849.5926027793' }
	 			date { Date.new(2018, 2, 15) }
	 		end
	 		
	 		factory :payment_0318 do	
	 			principal { BigDecimal '28993.84056579320' }
	 			date { Date.new(2018, 3, 15) }
	 		end
	 		
	 		factory :payment_0418 do	
	 			principal { BigDecimal '29138.8097686221' }
	 			date { Date.new(2018, 4, 16) }
	 		end
	 		
	 		factory :payment_0518 do	
	 			principal { BigDecimal '29284.5038174652' }
	 			date { Date.new(2018, 5, 15) }
	 		end
	 		
	 		factory :payment_0618 do	
	 			principal { BigDecimal '29430.92633655260' }
	 			date { Date.new(2018, 6, 15) }
	 		end
	 		
	 		factory :payment_0718 do	
	 			principal { BigDecimal '29578.08096823530' }
	 			date { Date.new(2018, 7, 16) }
	 		end
	 		
	 		factory :payment_0818 do	
	 			principal { BigDecimal '29725.97137307650' }
	 			date { Date.new(2018, 8, 15) }
	 		end
	 		
	 		factory :payment_0918 do	
	 			principal { BigDecimal '29874.60122994190' }
	 			date { Date.new(2018, 9, 17) }
	 		end
	 		
	 		factory :payment_1018 do	
	 			principal { BigDecimal '30023.97423609160' }
	 			date { Date.new(2018, 10, 15) }
	 		end
	 		
	 		factory :payment_1118 do	
	 			principal { BigDecimal '30663.83199352860' }
	 			date { Date.new(2018, 11, 16) }
	 		end
	 		
	 		factory :payment_1218 do	
	 			principal { BigDecimal '30817.15115349630' }	 			
	 			date { Date.new(2018, 12, 15) }
	 		end
	 	end
	end
end