Given /^I am on the home page$/ do
  visit(root_path)
end

When /^I visit the home page$/ do
  visit(root_path)
end

When /^I follow "([^"]*)"$/ do |link_name|
  click_link(link_name)
end

When /^I fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    step %{I fill in "#{name}" with "#{value}"}
  end
end

When /^I fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^I press "([^"]*)"$/ do |button_name|
  click_button(button_name)
end

Then /^I should be on the "([^"]*)" page$/ do |path_name|
  current_path.should == send("#{path_name.parameterize('_')}_path")
end

Given /^I am on the "([^"]*)" page$/ do |path_name|
  current_path.should == send("#{path_name.parameterize('_')}_path")
end

Given /^I go to the "([^"]*)" page$/ do |path_name|
  visit(send("#{path_name.parameterize('_')}_path"))
end

Then /^I should be on the home page$/ do
  current_path.should == root_path
end

Then "I should be on that users page" do
  user = User.last
  current_path.should == user_path(user.id)
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should not see "(.*?)"$/ do |text|
  page.should_not have_content(text)
end

Then "I pry" do
  require 'pry'; binding.pry
end

Given "I am signed in" do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
    :provider => 'twitter',
    :uid => 12345,
    :info => { :nickname => 'dummy' },
    :credentials => { :token => 1234, :secret => 4321 },
    :extra => { :raw_info => { :time_zone => nil }}
  })
  visit '/auth/twitter'
end


