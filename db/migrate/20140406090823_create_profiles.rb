class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :province
      t.date :date_of_birth

      t.timestamps
    end
  end
end
