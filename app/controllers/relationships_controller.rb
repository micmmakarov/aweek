class RelationshipsController < ApplicationController

  def create
    @organisation = Organisation.find(params[:relationship][:organisation_id])
    current_user.follow_organisation!(@organisation)
    respond_to do |format|
      format.html { redirect_to @organisation }
      format.js
    end
  end

  def destroy
    @organisation = Relationship.find(params[:id]).organisation
    current_user.unfollow_organisation!(@organisation)
    respond_to do |format|
      format.html { redirect_to @organisation }
      format.js
    end
  end
  
  def follow
	
	@user = User.find(params[:id])
	if current_user.following_user?(@user) then
		current_user.unfollow_user!(@user)
	else
		current_user.follow_user!(@user)
	end
    
	respond_to do |format|
      format.html { redirect_to User }
      format.js { render 'users/follow.js' }
    end
  
  end
	
 
  
end