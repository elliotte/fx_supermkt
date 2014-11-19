FactoryGirl.define do
  factory :deal do
    sell_currency "USD"
    buy_currency "INR"
    rate "9.99"
    vendor
  end

end
