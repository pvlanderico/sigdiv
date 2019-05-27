require 'rails_helper'

RSpec.feature "TransactionItemSpec.rbs", type: :feature do
include ActionView::Helpers::NumberHelper
include ApplicationHelper

	before(:each) do  	
	  	@debt = create(:debt, transaction_infos: [create(:debt_withdraw), create(:debt_amortization)])

	  	@debts = create_list(:debt, 30)
	end

	scenario 'Visit index page' do
   		visit(debts_path)
   		expect(page).to have_current_path(debts_path)
	end

	scenario 'Create the withdraw' do
	  	visit(debts_path)
	  	click_link("mostra-#{@debt.id}")
	  	click_on('Movimentações')
	  	expect(page).to have_content('Registrar desembolso')
	  	click_on('Registrar desembolso')

	  	fill_in('Valor (BRL) *', with: '1000')
	  	fill_in('Taxa de conversão:', with: '2')
	  	
	  	expect(find_field('Valor *').value).to eq('500')
	    
	  	click_on('Salvar')
	   
	  	t = Time.now
	   
	  	expect(find('.edit-transaction')).to have_content('D ' + t.strftime("%d-%m-%Y"))
    end

end
