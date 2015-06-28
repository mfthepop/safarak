class AlterPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :tour_id, :integer
    add_column :pictures, :location_id, :integer
    add_column :pictures, :user_id, :integer

    add_index :pictures, :tour_id
    add_index :pictures, :location_id
    add_index :pictures, :user_id
  end
end
