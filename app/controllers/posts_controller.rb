class PostsController < ApplicationController
  expose(:posts) { Post.published }
  expose(:post)
end
