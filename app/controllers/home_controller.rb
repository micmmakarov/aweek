class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
	@new_post = Post.new
    @posts = Post.all
    @events = Event.all 
    @organisations = Organisation.all 
  end

end
