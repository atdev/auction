FactoryGirl.define do
  factory :product do
    sequence(:name)  { |n| "Product_#{n}" }
    sequence(:shop_price)  { |n| 2000+n }
    description "description for the product"
  end
end