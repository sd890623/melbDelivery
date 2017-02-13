FactoryGirl.define do
  factory :review do
    time "2017-01-17 23:25:00"
    rating 1
    comment "MyText"
    association :shop, factory: :shop
  end
end
