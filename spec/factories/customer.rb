FactoryGirl.define do
  factory :customer do
    sequence(:email) { |n| "customer#{n}@fxmkt.com" }
    password '123456789'
  end
end
