class RemoveValueCurrencyFromWithdraws < ActiveRecord::Migration[5.2]
  def change
    remove_column :withdraws, :value_currency, :string
  end
end
