	require 'rubygems'
	require 'simple-rss'
    require 'open-uri'
    require 'nokogiri'
	
class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :except => :profile



  def index
	@posts = Post.all(:order => "created_at DESC")
	
	if params[:feed]== 1 then
		@posts = current_user.following_org_posts
	end
	
	if params[:feed]== 2 then
		@posts = current_user.following_user_posts
	end
	
	if params[:feed]== 3 then
		@posts = current_user.following_posts
	end
	
	@events = Event.all(:order => "created_at DESC")
    @organisations = Organisation.all 
	@attachments = Attachment.all
	@categories = Category.all
	@randoms = Attachment.all(:order => "RANDOM()", :limit => 20)
  end
  
  def neighborhoods
    @events = Event.all(:order => "created_at DESC")
    @organisations = Organisation.all 
  end
  
  
  def thumbs
	attachments = Attachment.all
	attachments.each do |attachment|
		puts "!!!"
		puts "!!!"
		puts "!!!"
		puts "Regeneration pics for " + attachment.id.to_s	
		attachment.pic.reprocess!
	end
	render text: "OK!"
  end
  
  def xmls

	#@rss = SimpleRSS.parse open('http://techcrunch.com/feed/')	
#http://www.shareable.net/blog/feed
#http://techcrunch.com/feed/
#http://mashable.com/feed/
#http://lenta.ru/rss/
	if params[:feed] then 
		@rss = Nokogiri::XML(open(params[:feed]))
	else
		@rss = Nokogiri::XML(open('http://mashable.com/feed/'))
	end
	
	@xml_categories = @rss.xpath('///category').map{|i|
		i.inner_text
	}.flatten.uniq!.sort!
	#binding.pry
	
  end
  
  def contributors
	@contributors = User.find_all_by_role(7)
	
  end

  def profile

  end
  
  
  end
