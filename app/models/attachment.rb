class Attachment < ActiveRecord::Base

	belongs_to :post
	belongs_to :event
	
	has_attached_file :pic, :styles => { :medium => "500x280>", :thumb => "150x100#" },
	:storage => :s3,
    :bucket => 'aweek1024',
    :s3_credentials => {
      :access_key_id => 'AKIAI25BIECHIO4NCM3Q',
      :secret_access_key => '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',
    },
	:path => ":attachment/:id/:style.:extension"

end
