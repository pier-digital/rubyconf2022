# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Auto::Contract.create!(
  user_id: "caio",
  modifiers: "uber",
  market_value_coefficient: 1.0
)

Smartphone::Contract.create!(
  user_id: "beto",
  plan_id: "iphone_58_1tb",
  imei: "12345678900"
)