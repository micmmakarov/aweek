class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :all_categories
  helper_method :contributor?

  def all_categories
	Category.all
  end

  def contributor?
    "1" if (current_user && current_user.role==7)
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
