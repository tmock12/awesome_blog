Given /^I am logged into Twitter as the following user:$/ do |table|
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    :provider => 'twitter',
    :uid => table.rows_hash[:uid],
    :info => { :nickname => table.rows_hash[:nickname] }
  })
end
