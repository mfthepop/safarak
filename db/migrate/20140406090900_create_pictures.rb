class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :caption
      t.date :date_taken

      t.timestamps
    end
  end
end
