class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_categories

  def all_categories
	Category.all
  end

  
  
  before_filter :authenticate_user!
 
 
 
 
  layout :layout_by_resource

  def layout_by_resource
    if (devise_controller? && resource_name == :admin && action_name == 'new')
		"admin_login"
	elsif admin_signed_in?
		"admins"
	else
      "application"
    end
	
	
  end
 
  
end
