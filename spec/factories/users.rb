FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email }
    password              {'1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {"あア阿"}
    first_name            {"いイ胃"}
    last_name_kana        {"カタカナ"}
    first_name_kana       {"カタカナ"}
    date_of_birth         {Faker::Date.birthday(min_age: 18, max_age: 65)}
    
  end
end