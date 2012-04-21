class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    @posts = Post.all
    @events = Event.all 
    @organisations = Organisation.all 
	@attachments = Attachment.all
  end

end
