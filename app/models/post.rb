class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :publish_time, :published, :title, :user_id, :attached_image
  scope :published, lambda { where("publish_time < ?", Time.zone.now ) }
  has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

end
