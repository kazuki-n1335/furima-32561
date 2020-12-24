FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_number { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Gimei.city.kanji }
    house_number { Faker::Number.number(digits: 4) }
    building_name { Faker::Games::Pokemon.name }
    telephone_number { Faker::Number.leading_zero_number(digits: 11) }
    user_id { Faker::Number.between(from: 1, to: 50) }
    item_id { Faker::Number.between(from: 1, to: 50) }
  end
end
