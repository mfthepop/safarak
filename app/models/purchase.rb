class Purchase < ActiveRecord::Base
	belongs_to :profile
	belongs_to :tour
end
