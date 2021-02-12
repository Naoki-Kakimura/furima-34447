FactoryBot.define do
  factory :order_purchase do
    post_num {"#{Faker::Number.decimal_part(digits: 3)}-#{Faker::Number.decimal_part(digits: 4)}"}
    prefecture_id {Faker::Number.within(range: 2..48)}
    phone_num {Faker::Number.decimal_part(digits: 11)}
    municipality {Faker::Alphanumeric.alpha(number: 10)}
    address {Faker::Alphanumeric.alpha(number: 10)}
    bill_name {Faker::Alphanumeric.alpha(number: 10)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
