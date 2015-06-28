class AddProfileIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :profile_id, :integer
    add_index :purchases, :profile_id
  end
end
