class AddExpiryDateToDeals < ActiveRecord::Migration
  def up
    add_column :deals, :expiry_date, :datetime
  end

  def down
    remove_column :deals, :expiry_date
  end
end
