class Organisation < ActiveRecord::Base

  has_attached_file :pic, :styles => { :medium => "x300", :thumb => "60x60#" }
	
  belongs_to :user
  has_many :posts
  has_many :events
  belongs_to :category

end
