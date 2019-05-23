require 'rails_helper'

# Collection matchers
require 'rspec/collection_matchers'

RSpec.describe TransactionInfo, type: :model do
	before do
		@debt = create :debt  
	end

  context 'when creating with a new transaction_type' do
  	before do  		
  		@transaction_type_attributes = { name: 'Taxa Adm', operator: '-' }
  		@transaction_info = TransactionInfo.create debt: @debt, formula: '0.5', transaction_type_attributes: @transaction_type_attributes
  	end

  	it 'creates the new type' do
  		expect(TransactionType.last).to have_attributes(@transaction_type_attributes)
  	end
  end

  context 'when creating with no transaction_type' do
  	before do  				
  		@transaction_info = TransactionInfo.create debt: @debt, formula: '0.5', transaction_type: TransactionType.new
  	end

  	it 'fails validation' do
  		expect(@transaction_info).to have(1).error_on('transaction_type.name')
  		expect(@transaction_info).to have(1).error_on('transaction_type.operator')
  	end
  end

  context 'when creating with a persisted transaction_type' do
  	before do
  		@transaction_type = TransactionType.create name: TransactionType::BASIC_TYPES[1], operator: '+'
  		@transaction_info = TransactionInfo.create transaction_type: @transaction_type, transaction_type_attributes: { operator: '-', id: @transaction_type.id }
  	end

  	it 'does not update type attributes' do
  		expect(@transaction_type.reload.operator).to eq('+')
  	end
  end
end