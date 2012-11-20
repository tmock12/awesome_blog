When /^I wait for (\d+) seconds?$/ do |secs|
  sleep secs.to_i
end

Given "I go to my dashboard" do
  visit '/dashboard'
end
