class Relationship < ActiveRecord::Base

	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"
	belongs_to :organisation, class_name: "Organisation"

end
