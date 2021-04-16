FactoryBot.define do
  factory :item do
    product { Faker::Lorem.sentence }
    category_id     { 2 }
    information     { Faker::Lorem.sentence }
    condition_id    { 2 }
    shipping_fee_id { 2 }
    prefecture_id   { 2 }
    days_to_ship_id { 2 }
    selling_price   { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'test_image.png')
    end
  end
end
