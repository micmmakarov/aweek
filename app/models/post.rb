class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :organisation
  belongs_to :category
  
  has_many :attachments, :dependent => :destroy
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true
  

  def viewed!
	i = views.to_i + 1
	self.views = i.to_i
	self.save
  end
  
  def feature!
	self.featured = true
	self.save
  end
  def unfeature!
	self.featured = false
	self.save
  end
  def publish!
	self.published = true
	self.save
  end
  def unpublish!
	self.published = false
	self.save
  end
  

  
  
end
  