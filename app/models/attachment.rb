class Attachment < ActiveRecord::Base

	belongs_to :post
	belongs_to :event
	
	has_attached_file :pic, :styles => { :medium => "500x280>", :thumb => "150x100#" }

end
