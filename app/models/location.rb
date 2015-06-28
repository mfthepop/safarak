class Location < ActiveRecord::Base
	
	has_attached_file :avatar, :styles => {:medium => "300x300#", :thumb => "100x100#"}, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	has_many :tours, dependent: :destroy
	has_many :reviews, as: :reviewable
	has_many :comments, as: :commentable
  has_many :pictures
	has_many :ratings, as: :ratable
	

	validates :name, presence: true
	validates :province, presence: true
	validates :description, presence: true
	
	def average_rating
			ratings.sum(:score) / ratings.size
	end
	
	def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
	end
	
end
