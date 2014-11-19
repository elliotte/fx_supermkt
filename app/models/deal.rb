class Deal < ActiveRecord::Base
  belongs_to :vendor

  validates_uniqueness_of :sell_currency, scope: [:buy_currency]
  validates_presence_of :sell_currency, :buy_currency, :rate, :vendor_id
end
