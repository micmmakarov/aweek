class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :except => :profile
  
  def index
    @posts = Post.all(:order => "created_at DESC")
    @events = Event.all(:order => "created_at DESC")
    @organisations = Organisation.all 
	@attachments = Attachment.all
  end
  
  def profile
  end
  
  end
