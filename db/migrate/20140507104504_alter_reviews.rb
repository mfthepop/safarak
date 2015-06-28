class AlterReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :detail, :content
    add_column :reviews, :reviewable_id, :integer
    add_column :reviews, :reviewable_type, :string
    add_column :reviews, :user_id, :integer
    remove_column :reviews, :score
    add_index :reviews, :reviewable_id
  end
end
