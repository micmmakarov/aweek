class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  has_many :posts
  has_many :events
  has_one :organisation
  
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_organisations, through: :relationships, source: "organisation_id"
  
  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end
  
  def follow_organisation!(organisation)
    relationships.create!(organisation_id: organisation.id)
  end
  
end
