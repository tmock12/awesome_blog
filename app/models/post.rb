class Post < ActiveRecord::Base

  attr_accessible :content, :publish_time, :published, :title, :user_id, :attached_image
  has_attached_file :attached_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  before_create :set_initial_published_attribute

  belongs_to :user

  validates :title, :content, :publish_time, :user, presence: true
  validates_each :publish_time, on: :create do |record, attr, value|
    record.errors.add(attr, 'must be in future') if value < (Time.zone.now - 5.minutes)
  end

  scope :published, lambda { order("publish_time DESC").where("publish_time < ?", Time.zone.now ) }

  def set_initial_published_attribute
    if self.publish_time <= Time.zone.now
      send_to_twitter if Rails.env == "production"
      self.published = true
    end
  end

  def set_published_attribute
    self.update_attribute(:published, true)
    send_to_twitter if Rails.env == "production"
  end

  def send_to_twitter
    user_twitter_account.update(tweet)
  end

  def tweet
    "#{self.title} published. see it here: #{full_post_url}"
  end

  def full_post_url
    ENV['WEBHOSTNAME'] + Rails.application.routes.url_helpers.post_path(self)
  end

  def user_twitter_account
    Twitter::Client.new(oauth_token: user_oauth_token, oauth_token_secret: user_oauth_secret)
  end

  def user_oauth_token
    self.user.oauth_token
  end

  def user_oauth_secret
    self.user.oauth_token_secret
  end

  def self.publish_articles
    ready_posts = Post.published.where("published = ?", false)
    ready_posts.each(&:set_published_attribute)
  end

end
