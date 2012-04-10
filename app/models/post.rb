class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
  has_many :attachments
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
  