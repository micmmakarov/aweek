class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_categories

  def all_categories
	Category.all
  end

  
  before_filter :authenticate_user!
 
  
end
