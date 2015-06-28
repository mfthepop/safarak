class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.date :departure_date
      t.time :departure_time
      t.string :departure_location
      t.integer :quorum
      t.integer :registered

      t.timestamps
    end
  end
end
