require 'rails_helper'

RSpec.feature "Payments", type: :feature, js: true do
	include ActionView::Helpers::NumberHelper
  include ApplicationHelper

	before do
  	@debt = create(:debt, charges: [ build(:adm_tax), build(:credit_risk) ])
  	create_list(:transaction_2019, 12)
    @withdraw = create(:transaction_2019, date: Date.new(2019,12,31), debt: @debt)
    create(:transaction_2018)
    FactoryBot.rewind_sequences
  end

  it 'Visit index page' do
  	visit(debts_path)
  	expect(page).to have_current_path(debts_path)
  end

  it 'Create a Payment' do
  	visit(debts_path)
  	click_link("mostra-#{@debt.id}")
  	click_on('Movimentações')
  	expect(page).to have_content('Registrar pagamento')
  	click_on('Registrar pagamento')

  	fill_in('Principal em unidade monetária *', with: '314,88896')
  	fill_in('Juros', with: '64.751,02726')
  	fill_in('Taxa administrativa', with: '21.583,67575')
  	fill_in('Risco de crédito', with: '7.554,28651')
  	fill_in('Taxa de conversão', with: '2')

  	expect(find_field('Principal (BRL)').value).to eq('629,78')
    expect(find_field('Juros (BRL)').value).to eq('129.502,05')
  	expect(find_field('Taxa administrativa (BRL)').value).to eq('43.167,35')
  	expect(find_field('Risco de crédito (BRL)').value).to eq('15.108,57')

  	click_on('Salvar')
   
  	t = Time.now
   
  	expect(find('.edit-transaction')).to have_content('PR ' + t.strftime("%d-%m-%Y"))
  end

  it 'Show the withdraw' do
  	visit(debts_path)
  	click_link("mostra-#{@debt.id}")
  	click_on('Movimentações')
   
  	expect(page).to have_content('Registrar desembolso')
  	expect(page).to have_content(big_decimal_to_currency @withdraw.value)
  	
  	date_payment = 'D 31-12-2019'
  	expect(find('.edit-transaction')).to have_content(date_payment)
  end

  it 'Edit the withdraw' do
  	visit(debts_path)
  	click_link("mostra-#{@debt.id}")
  	click_on('Movimentações')
   
  	expect(page).to have_content('Registrar desembolso')
  	expect(page).to have_content(big_decimal_to_currency @withdraw.value)

  	date_payment = 'D 31-12-2019'

  	expect(find('.edit-transaction')).to have_content(date_payment)
  	page.find('.edit-transaction',text: date_payment).click
  	print page.html
    #expect(page).to have_content('Editar desembolso')
  end

  it 'Edit a Payment' do
  	visit(debts_path)
  	click_link("mostra-#{@debt.id}")
  	click_on('Movimentações')

  	#t = Time.now
  	date_payment = 'PR 31-12-2019' 
  	#t.strftime("%d-%m-%Y")
  	expect(page).to have_content('Registrar pagamento')
  	print page.html
  
    page.find('.edit-transaction',text: date_payment).click
    expect(page).to have_content('Editar pagamento')

    # ------------------------------------------------------------------- #
    # tem que fazer um para alterar o valor do pagamento e mandar salvar  #
    # ------------------------------------------------------------------- #
  end
end
