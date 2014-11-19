FactoryGirl.define do
  factory :vendor do
    sequence(:email) { |n| "vendor#{n}@fxmkt.com" }
    password '123456789'
  end
end
