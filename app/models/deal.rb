class Deal < ActiveRecord::Base
  belongs_to :vendor

  validates_presence_of :sell_currency, :buy_currency, :rate, :vendor_id

  scope :active, -> {where('expiry_date >= ?', Time.now.end_of_day)}

  # Return the name of the currencies
  def name
    "#{sell_currency}-#{buy_currency}"
  end

  def self.search_deals(params)
    query = []
    params.each do |k, v|
      query << "#{k} = '#{v}'" unless v.blank?
    end
    Deal.active.where(query.join(' and ')).order('created_at desc')
  end
end
