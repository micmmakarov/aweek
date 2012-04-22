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
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  
end