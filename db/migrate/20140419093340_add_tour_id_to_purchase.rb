class AddTourIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :tour_id, :integer
    add_index :purchases, :tour_id
  end
end
