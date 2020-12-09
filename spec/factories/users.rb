FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {gimei.last.kanji}
    first_name            {gimei.first.kanji}
    reading_family_name   {gimei.last.katakana}
    reading_first_name    {gimei.first.katakana}
    birth_day             {'1995/3/20'}
  end
end
