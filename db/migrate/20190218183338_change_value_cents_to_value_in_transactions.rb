class ChangeValueCentsToValueInTransactions < ActiveRecord::Migration[5.2]
  def change  	
  	rename_column :transactions, :value_cents, :value
  	change_column :transactions, :value, :float
  end
end
