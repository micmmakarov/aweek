class Attachment < ActiveRecord::Base

	belongs_to :post
	belongs_to :event
	
	has_attached_file :pic, :styles => { :feed => "480x400>", :medium => "500x400#",:slide => "180x260#", :thumb => "150x100#" },
	:storage => :s3,
    :bucket => 'aweek1024',
	:convert_options => { :thumb => "-quality 92" },
    :s3_credentials => {
      :access_key_id => 'AKIAI25BIECHIO4NCM3Q',
      :secret_access_key => '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',
    }
	#:path => ":attachment/:id/:style.:extension"
	
	
  def upload_image(url)
    begin
      io = open(URI.escape(url))
      if io
        def io.original_filename; base_uri.path.split('/').last; end
        io.original_filename.blank? ? nil : io
        p.pic = io
      end
      p.save(false)
    rescue Exception => e
      logger.info "EXCEPTION# #{e.message}"
    end
  end
	
end
