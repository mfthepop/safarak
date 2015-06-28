class AddRatableTypeToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :ratable_type, :string
  end
end
