FactoryGirl.define do
  factory :shop do
    location { Faker::Address.city }
    date { Faker::Date.forward(5) }
    shop_kind { Faker::Lorem.word }
    shopper { Faker::Name.name }
    is_complete { Faker::Boolean.boolean }
  end
end