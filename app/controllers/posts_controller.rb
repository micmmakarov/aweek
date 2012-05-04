class PostsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :new]
  before_filter :authenticate_admin!, :only => :index
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
	@post.viewed!
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
	5.times { @post.attachments.build }
    @organisations = Organisation.all
    @categories = Category.all

	if params[:ajax1] then
		render 'posts/ajax_form', :layout => false
	else
		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @post }
		end
	end
	
  end

  # GET /posts/1/edit
  def edit
    @organisations = Organisation.all
    @post = Post.find(params[:id])
	5.times { @post.attachments.build }
	@categories = Category.all

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
	@post.user_id = current_user.id
	
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end

  def publish
	@post = Post.find(params[:id])
	if @post.published then
		@post.unpublish!	
	else
		@post.publish!	
	end
	respond_to do |format|
      format.html { head :ok }
      format.js { render "posts/publish.js" }
    end
  end
  
  def feature
	@post = Post.find(params[:id])
	if @post.featured then
		@post.unfeature!	
	else
		@post.feature!	
	end
	respond_to do |format|
      format.html { head :ok }
      format.js { render "posts/feature.js" }
    end

  end  
  
  
end
