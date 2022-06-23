class CreateSmartphoneContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :smartphone_contracts do |t|
      t.string :user_id
      t.string :plan_id
      t.string :imei

      t.timestamps
    end
  end
end
