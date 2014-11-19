class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :sell_currency
      t.string :buy_currency
      t.decimal :rate, precision: 5, scale: 2
      t.references :vendor, index: true

      t.timestamps
    end
  end
end
