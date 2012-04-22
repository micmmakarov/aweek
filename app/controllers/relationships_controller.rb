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
    @organisation = Organisation.find(params[:relationship][:organisation_id])
    current_user.unfollow_organisation!(@organisation)
    respond_to do |format|
      format.html { redirect_to @organisation }
      format.js
    end
  end
  
end