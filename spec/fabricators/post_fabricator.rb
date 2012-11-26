Fabricator(:post) do
  title "dummy post"
  content "dummy content"
  user { Fabricate(:user) }
end
