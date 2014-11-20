class Purchase < ActiveRecord::Base
  belongs_to :deal
  belongs_to :customer

  validates_presence_of :deal_id, :customer_id, :amount
end
