require 'nokogiri'
require 'open-uri'

class Libor
	BASE_URL = "http://indicadoreseconomicos.bccr.fi.cr/indicadoreseconomicos/cuadros/frmvercatcuadro.aspx?CodCuadro=342&Idioma=2&FecInicial=[DATE]&FecFinal=[DATE]"

	class << self

		def on date
			get_value(date)
		end		

		private
			def get_value date
				parse open(BASE_URL.gsub("[DATE]", date.to_s), "r")				
			end

			def parse page
				Nokogiri::HTML(page).css("#Table342 td.celda342[align='right'] p").text
			end
	end
end