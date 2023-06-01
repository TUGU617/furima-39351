FactoryBot.define do
  factory :item do
    product_name        {'商品名'}
    explanation         {'商品の説明'}
    category_id         {2}
    situation_id        {3}
    delivery_charge_id  {4}
    prefecture_id       {5}
    date_of_shipment_id {6}
    price               {rand(300..9_999_999)}
    association :user, factory: :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
