FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'a1' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '陸太郎' }
    family_name_reading { 'ヤマダ' }
    first_name_reading { 'リクタロウ' }
    birth_id { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
