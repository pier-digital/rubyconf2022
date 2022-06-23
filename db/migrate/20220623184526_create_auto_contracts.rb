class CreateAutoContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :auto_contracts do |t|
      t.string :user_id
      t.string :modifiers
      t.float :market_value_coefficient

      t.timestamps
    end
  end
end
