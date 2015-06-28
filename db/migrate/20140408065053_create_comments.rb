class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :detail

      t.timestamps
    end
  end
end
