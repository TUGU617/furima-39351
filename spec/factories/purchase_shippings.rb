FactoryBot.define do
  factory :purchase_shipping do
    item_id              {1}
    user_id              {2}
    purchase_record_id   {3}
    post_code            {Faker::Number.between(from: 100, to: 999).to_s + "-" + Faker::Number.between(from: 1000, to: 9999).to_s }
    prefecture_id        {Faker::Number.between(from: 1, to: 47)}
    municipalities       {Faker::Address.city}
    address              {Faker::Address.street_address}
    building_name        {Faker::Address.building_number}
    number               {"0" + Faker::Number.between(from: 100000000, to: 9999999999).to_s}
    token                {"tok_abcdefghijk00000000000000000"}
  end
end
