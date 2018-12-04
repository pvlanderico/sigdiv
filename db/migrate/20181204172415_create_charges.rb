class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :name
      t.float :base
      t.string :formula

      t.timestamps
    end
  end
end
