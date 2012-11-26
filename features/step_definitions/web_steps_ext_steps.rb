When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

Given "I go to my dashboard" do
  visit '/dashboard'
end

When /^I select "([^\"]*)" as the date$/ do |date|
  month, day, year = date.split('/')
  find(:css, "select[id*='1i']").select(year)
  find(:css, "select[id*='2i']").select(month)
  find(:css, "select[id*='3i']").select(day.to_i.to_s)
end

When "I confirm" do
  page.driver.browser.switch_to.alert.accept
end

When /^I attach the file at "([^\"]*)" to "([^\"]*)"$/ do |path, field|
  attach_file(field, path)
end

Then /^I should see the image "(.+)"$/ do |image|
  page.should have_xpath("//img[contains(@src, \"#{image}\")]")
end

Then "I should be on that posts page" do
  post = Post.last
  current_path.should == post_path(post)
end

Then "I should be on that user posts page" do
  user = User.last
  post = Post.last
  current_path.should == user_post_path(user, post)
end
