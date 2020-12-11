FactoryBot.define do
  factory :item do
    introduce { Faker::Lorem.sentence }
    name { Faker::Games::Pokemon.name }
    value { Faker::Number.between(300, 100_000) }
    category_id { Faker::Number.between(1, 10) }
    item_status_id { Faker::Number.between(1, 6) }
    delivery_fee_id { Faker::Number.between(1, 2) }
    shipping_area_id { Faker::Number.between(1, 47) }
    shipping_day_id { Faker::Number.between(1, 3) }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
