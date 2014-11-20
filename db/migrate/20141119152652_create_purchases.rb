class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :deal, index: true
      t.decimal :amount, precision: 5, scale: 2
      t.references :customer, index: true

      t.timestamps
    end
  end
end
