class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :publish_time, :published, :title, :user_id
end
