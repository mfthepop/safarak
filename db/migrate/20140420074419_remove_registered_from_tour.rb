class RemoveRegisteredFromTour < ActiveRecord::Migration
  def change
    remove_column :tours, :registered, :integer
  end

end
