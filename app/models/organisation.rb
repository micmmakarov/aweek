class Organisation < ActiveRecord::Base

  has_attached_file :pic, :styles => { :medium => "x300", :thumb => "60x60#" },
  :storage => :s3,
    :bucket => 'aweek1024',
	:convert_options => { :thumb => "-quality 92" },
    :s3_credentials => {
      :access_key_id => 'AKIAI25BIECHIO4NCM3Q',
      :secret_access_key => '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',
    }
	
  belongs_to :user
  has_many :posts
  has_many :events
  belongs_to :category
  
  has_many :relationships
  has_many :followers, through: :relationships,  class_name: "User"

	def following(user)
		
	end
	
end
