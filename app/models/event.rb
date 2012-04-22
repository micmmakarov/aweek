class Event < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :user
  belongs_to :category
  has_many :attachments, :dependent => :destroy

  accepts_nested_attributes_for :attachments, :allow_destroy => true

end
