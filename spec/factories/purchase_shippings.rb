FactoryBot.define do
  factory :purchase_shipping do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number {'08011111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
