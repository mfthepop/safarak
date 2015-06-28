class Review < ActiveRecord::Base
  include  PublicActivity::Common
	belongs_to :reviewable, polymorphic: true
  belongs_to :tour, :class_name => 'Tour', :foreign_key => 'commentable_id'
  belongs_to :user

  scope :review_type, -> (review_type) { where review_type: review_type }

  RTYPE = %w{ couple friends family_with_young_children family solo }

  RTYPE.each_with_index do |meth, index|
    define_method("#{meth}?") { type == index }
  end

  validates :content, presence: true
  # validates :user_id, :uniqueness => { :scope => :product_id,
#                                       :message => "Users may only write one review per product." }

end
