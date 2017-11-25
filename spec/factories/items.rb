FactoryGirl.define do
  factory :item do
    name { Faker::Commerce.product_name }
    brand { Faker::Company.name }
    max_price { Faker::Commerce.price }
    quantity { Faker::Number.between(1, 10) }
    comment { Faker::Lorem.sentence }
  end
end
