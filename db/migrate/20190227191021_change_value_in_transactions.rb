class ChangeValueInTransactions < ActiveRecord::Migration[5.2]
  def change
  	change_column :transactions, :value, :decimal
  end
end
