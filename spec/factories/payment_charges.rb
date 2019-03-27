FactoryBot.define do
  factory :payment_charge do
    debt_id { 1 }
    charge_id { 1 }
    value { "9.99" }
  end
end
