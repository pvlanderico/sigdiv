class AddInstalmentsNumberToDebts < ActiveRecord::Migration[5.2]
  def change
    add_column :debts, :instalments_number, :integer
  end
end
