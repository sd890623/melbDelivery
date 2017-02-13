FactoryGirl.define do
  factory :order do
    phone "MyString"
    address "MyString"
    delivery_time "MyString"
    delivery_method "MyString"
    delivery_fee 50.0
    total_fee 50.0
  end
end
