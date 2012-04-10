class Attachment < ActiveRecord::Base

	belongs_to :post
	belongs_to :event
	
	has_attached_file :pic, :styles => { :medium => "500x280>", :thumb => "150x100#" },
	:storage => :s3,
    :bucket => ENV['AWeek'],
    :s3_credentials => {
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

end
