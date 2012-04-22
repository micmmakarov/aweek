class Category < ActiveRecord::Base

	has_many :posts
	has_many :organisations
	has_many :events

end
