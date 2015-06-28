class Tour < ActiveRecord::Base


  include PublicActivity::Common


  belongs_to :location
	has_and_belongs_to_many :users
	has_many :reviews, as: :reviewable
	has_many :bookings
	has_many :users, :through => :bookings
	has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :pictures
	has_many :ratings, as: :ratable




	validates :departure_location, presence: true
	validates :quorum, presence: true,
	          :numericality => {greater_than_or_equal_to: 0, only_integer: true}
	validates :price, presence: true,
	          :numericality => {greater_than_or_equal_to: 0, only_integer: true}

	def self.search(search)
    if search
      where('quorum LIKE ?', "%#{search}%")
    else
      scoped
    end
	end
	
	def average_rating
			if ratings.size==0
			ratings.sum(:score)
			else
			ratings.sum(:score) / ratings.size
		end	
	end

	def bookings_total
		self.users.count
	end
	

end
