FactoryGirl.define do
  factory :category do
    name "MyString"
    association :shop, factory: :shop
  end
end
