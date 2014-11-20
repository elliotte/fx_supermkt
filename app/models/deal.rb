class Deal < ActiveRecord::Base
  belongs_to :vendor

  validates_presence_of :sell_currency, :buy_currency, :rate, :vendor_id

  # Return the name of the currencies
  def name
    "#{sell_currency}-#{buy_currency}"
  end
end
