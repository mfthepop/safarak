class Comment < ActiveRecord::Base
	include  PublicActivity::Common
 # tracked except: :update, owner: ->(controller, model) { controller && controller.current_user }



  has_ancestry
	belongs_to :commentable, polymorphic: true
	belongs_to :tour, :class_name => 'Tour', :foreign_key => 'commentable_id'
  belongs_to :location, :class_name => 'Location', :foreign_key => 'commentable_id'
  belongs_to :user
end
