require 'rails_helper'

RSpec.feature "Payments", type: :feature, js: true do
  it 'Visit index page' do
  	visit(debts_path)
  	expect(page).to have_current_path(debts_path)
  end

  it 'Create a Payment' do
  	@debt = create(:debt, charges: [ build(:adm_tax), build(:credit_risk) ])
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

  	#expect(find('.table-hover')).to have_content(date.today)
  end
end
