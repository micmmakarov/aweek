class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :except => :profile
  
  def index
    @posts = Post.all(:order => "created_at DESC")
    @events = Event.all(:order => "created_at DESC")
    @organisations = Organisation.all 
	@attachments = Attachment.all
	@categories = Category.all
	@randoms = Attachment.all(:order => "RANDOM()", :limit => 20)
  end
  
  def neighborhoods
    @events = Event.all(:order => "created_at DESC")
    @organisations = Organisation.all 
  end
  
  def profile
  end
  
  def thumbs
	attachments = Attachment.all
	attachments.each do |attachment|
		puts "!!!"
		puts "!!!"
		puts "!!!"
		puts "Regeneration pics for " + attachment.id.to_s	
		attachment.pic.reprocess!
	end
	render text: "OK!"
  end
  
  end
