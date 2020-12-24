FactoryBot.define do
  factory :item do
    introduce { Faker::Lorem.sentence }
    name { Faker::Games::Pokemon.name }
    value { Faker::Number.between(from: 300, to: 100000) }
    category_id { Faker::Number.between(from: 1, to: 10) }
    item_status_id { Faker::Number.between(from: 1, to: 6) }
    delivery_fee_id { Faker::Number.between(from: 1, to: 2) }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    shipping_day_id { Faker::Number.between(from: 1, to: 3) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
