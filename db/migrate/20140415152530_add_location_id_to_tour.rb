class AddLocationIdToTour < ActiveRecord::Migration
  def change
    add_column :tours, :location_id, :integer
  end
end
