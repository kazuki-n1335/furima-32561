FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true) }
    password_confirmation { password }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    reading_family_name   { Gimei.last.katakana }
    reading_first_name    { Gimei.first.katakana }
    birth_day             { Faker::Date.between(from: '2000-09-23', to: '2010-09-25')}
  end
end
