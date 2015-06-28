class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :tour

  # validates :user_id, :uniqueness => { :scope => :tour_id,
  #                                      :message => "Users may only book once." }
end
