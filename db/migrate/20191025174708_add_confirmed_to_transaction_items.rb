class AddConfirmedToTransactionItems < ActiveRecord::Migration[5.2]
  def change
    add_column :transaction_items, :confirmed, :boolean
  end
end
