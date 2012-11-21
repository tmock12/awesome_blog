class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :publish_time, :published, :title, :user_id, :attached_image
  scope :published, lambda { where("publish_time < ?", Time.zone.now ) }
  has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  after_save :set_published_attribute

  def set_published_attribute
    if self.publish_time <= Time.now
      send_to_twitter unless Rails.env == "test"
      self.published = true
    else
      self.published = false
    end
  end

  def send_to_twitter
    user_twitter_account.update("#{self.title} has been published")
  end

  def user_twitter_account
    user_oauth_token = self.user.oauth_token
    user_oauth_secret = self.user.oauth_token_secret
    Twitter::Client.new(oauth_token: user_oauth_token, oauth_token_secret: user_oauth_secret)
  end

end
