class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :number_of_reservations
      t.integer :price

      t.timestamps
    end
  end
end
