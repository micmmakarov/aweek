class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :city
  has_many :posts
  has_many :events
  has_one :organisation
  
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :organisations, :through => :relationships, class_name: "Organisation", :source => :organisation
  
  
  def follow_organisation!(organisation)
    relationships.create!(organisation_id: organisation.id)
  end

  def unfollow_organisation!(organisation)
	puts relationships.find_by_organisation_id(organisation.id).organisation_id
    relationships.find_by_organisation_id(organisation.id).destroy
  end
	
  def flw(organisation)
	@r = Relationship.where("follower_id = :follower AND organisation_id = :org", :follower => id, :org => organisation.id).first
	"Hi" if @r 
  end
  
end
