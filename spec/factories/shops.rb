FactoryGirl.define do
  factory :shop do
    name Faker::Company.name
    mobile "0412345678"
    address_street Faker::Address.street_address
    address_suburb Faker::Address.city

    trait :with_item do

      after :create do |shop, evaluator|
        category = create :category, shop: shop
        create :item, category: category, shop: shop
      end
    end
  end
end
