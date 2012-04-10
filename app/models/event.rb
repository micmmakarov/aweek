class Event < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user
  has_many :attachments

end
