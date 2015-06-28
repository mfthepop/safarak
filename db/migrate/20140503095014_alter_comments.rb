class AlterComments < ActiveRecord::Migration
	def change
		rename_column :comments, :detail, :content
		add_column :comments, :commentable_id, :integer
		add_column :comments, :commentable_type, :string
		add_column :comments, :ancestry, :string
		add_column :comments, :user_id, :integer

		add_index :comments, :ancestry
	end
end
