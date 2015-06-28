class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
	    t.references :user
	    t.references :tour
      t.timestamps
    end
		add_index :bookings, ["user_id", "tour_id"]
  end

end
