json.array!(@deals) do |deal|
  json.extract! deal, :id, :sell_currency, :buy_currency, :rate, :vendor_id
  json.url deal_url(deal, format: :json)
end
