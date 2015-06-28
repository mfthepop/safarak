class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.decimal :score
      t.text :detail

      t.timestamps
    end
  end
end
