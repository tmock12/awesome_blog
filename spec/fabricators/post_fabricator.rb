Fabricator(:post) do
  title "dummy post"
  content "dummy content"
  publish_time Time.now
  user { Fabricate(:user) }
end
