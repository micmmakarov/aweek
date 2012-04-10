class Attachment < ActiveRecord::Base
	has_attached_file :pic, :styles => { :medium => "500x280>", :thumb => "150x100#" }
	belongs_to :post
	belongs_to :event
end
