Then "I should see a comment section" do
  page.should have_selector("div#disqus_thread")
end

Then "I should see a highlighted code section" do
  page.should have_selector("div.highlight")
end
