class CreateTransactionInfosTable < ActiveRecord::Migration[5.2]
  def change
    create_table :transaction_infos_tables do |t|
      t.string :formula
      t.boolean :pro_rata
      t.integer :payment_date
      t.text :description      
      t.integer :debt_id
      t.integer :transaction_type_id
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
