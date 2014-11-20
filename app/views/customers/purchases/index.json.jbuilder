json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :deal_id, :amount, :customer_id
  json.url customers_purchase_url(purchase, format: :json)
end
