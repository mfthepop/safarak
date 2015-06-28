class RemovePriceFromPurchase < ActiveRecord::Migration
  def change
    remove_column :purchases, :price, :integer
  end
end
