class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :publish_time, :published, :title, :user_id
  scope :published, lambda { where("publish_time < ?", Time.zone.now ) }

end
