class Profile < ActiveRecord::Base
	has_attached_file :avatar, :styles => {:medium => "300x300#", :thumb => "100x100#"}, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	
	belongs_to :user
	has_many :purchases


  GENDER = %w{ m f }

  GENDER.each_with_index do |meth, index|
    define_method("#{meth}?") { type == index }
  end
	
	def self.search(search)
    if search
      where('first_name LIKE ?', "%#{search}%")
    else
      scoped
    end
	end
end
