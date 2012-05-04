class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :pic, :styles => { :medium => "300x300#", :profile => "85x110#", :thumb => "30x30#",:small => "75x60#" },
:storage => :s3,
    :bucket => 'aweek1024',
	:convert_options => { :thumb => "-quality 92" },
    :s3_credentials => {
      :access_key_id => 'AKIAI25BIECHIO4NCM3Q',
      :secret_access_key => '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',
    }
	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :city, :role, :pic
  has_many :posts
  has_many :events
  has_one :organisation
  has_and_belongs_to_many :roles
  
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  
  has_many :organisations, :through => :relationships, class_name: "Organisation", :source => :organisation
  
  has_many :followeds, :through => :relationships, class_name: "User", :source => :followed, foreign_key: "follower_id"

  has_many :followers, :through => :relationships, class_name: "User", :source => :follower, :foreign_key => :followed

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
  
  def follow_organisation!(organisation)
    relationships.create!(organisation_id: organisation.id)
  end

  def unfollow_organisation!(organisation)
	puts relationships.find_by_organisation_id(organisation.id).organisation_id
    relationships.find_by_organisation_id(organisation.id).destroy
  end

  def follow_user!(user)
    relationships.create!(followed_id: user.id)
  end

  def unfollow_user!(user)
    relationships.find_by_followed_id(user.id).destroy
  end
  
  def following_user?(user)
	@r = Relationship.where("follower_id = :follower AND followed_id = :followed", :follower => id, :followed => user.id).first
	"Hi" if @r 
  end
  
  def approve_contributor
    self.role = 7 # if role = 7 then the user is considered to be a contributor
	self.save
  end

  def disapprove_contributor
    self.role = 4
	self.save
  end

  def apply_to_contributor
    self.role = 5  # if role = 5 then the user wants to be a contributor
	self.save
  end

  
  def flw(organisation)
	@r = Relationship.where("follower_id = :follower AND organisation_id = :org", :follower => id, :org => organisation.id).first
	"Hi" if @r 
  end
  
  def following_org_posts 
	organisations.map{|p|
	p.posts
	}.flatten
  end

  def following_user_posts 
	followeds.map {|p|
	p.posts
	}.flatten
  end
  
  def following_posts 
	list = following_org_posts + following_user_posts 
	# list.uniq!
	id2post = {}
	list.each { |post|
	id2post[post.id]||=post
	}
	id2post.values
  end
  
  def participating_organisations
  list=posts.map { |p| 
	p.organisation
	}.flatten.uniq!

	list
	
  end


  def views
    posts.sum(:views)
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = self.find_by_email(data.email)
      user
    else # Create a user with a stub password.
      self.create!(:email => data.email, :password => Devise.friendly_token[0,20])
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end
end
