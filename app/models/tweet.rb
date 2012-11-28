class Tweet

  def initialize(post)
    @post = post
    @user = post.user
  end

  def tweet_it
    user_twitter_account.update(tweet)
  end

  def tweet
    "#{@post.title} published. see it here: #{full_post_url}"
  end

  def full_post_url
    ENV['WEBHOSTNAME'] + Rails.application.routes.url_helpers.post_path(@post)
  end

  def user_twitter_account
    Twitter::Client.new(oauth_token: user_oauth_token, oauth_token_secret: user_oauth_secret)
  end

  def user_oauth_token
    @user.oauth_token
  end

  def user_oauth_secret
    @user.oauth_token_secret
  end

end
