class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  attr_accessible :name, :provider, :uid

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
      user.oauth_token = auth["credentials"]["token"]
      user.oauth_token_secret = auth["credentials"]["secret"]
      user.time_zone = auth["extra"]["raw_info"]["time_zone"]
    end
  end

end
