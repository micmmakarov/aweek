class Organisation < ActiveRecord::Base
  has_many :users
  has_many :posts
  has_many :events
end
