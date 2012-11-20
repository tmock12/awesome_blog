OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end

# if (Rails.env == 'test' || Rails.env == 'development')
#   module OmniAuthHelpers
#     def self.add_twitter_mock(uid, name, nickname)
#       OmniAuth.config.add_mock(:twitter,
#                                { :provider => 'twitter',
#                                  :uid => uid,
#                                  :info => { :name => name, :nickname => nickname}})
#     end
#   end
# end




