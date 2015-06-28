class AddNameToTour < ActiveRecord::Migration
  def change
    add_column :tours, :name, :string
  end
end
