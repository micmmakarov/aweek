class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  before_filter :authenticate_admin!, :except => [:show, :profile, :edit, :update]
  before_filter :authenticate_user!, :except => [:show]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @events = @user.events

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    if user_signed_in? then
      @user = current_user
    end
    if admin_signed_in? then
      @user = User.find(params[:id])
    end
  end

  # POST /users
  # POST /users.json
  def create

      @user = User.find(params[:id])


    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    if user_signed_in? then
      @user = current_user
    end
    if admin_signed_in? then
      @user = User.find(params[:id])
    end

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
  
  def approve
	@user = User.find(params[:id])
	if @user.role == 7 then
		@user.disapprove_contributor
	else
		@user.approve_contributor
	end
	
    respond_to do |format|
      format.html { redirect_to User }
      format.js { render "users/approve.js" }
    end
  end
  
  def profile
		puts "!!!"
	puts "!!!"
	puts "!!!"
	puts current_user.name

	@contributors = current_user.followeds
	@organisations = current_user.organisations
	respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => { :organisations => @organisation, :contributors => @contributors} }
    end
  end

end
