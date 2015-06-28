class AddPriceToTour < ActiveRecord::Migration
  def change
    add_column :tours, :price, :integer
  end
end
