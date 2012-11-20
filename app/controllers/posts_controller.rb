class PostsController < ApplicationController
  expose(:posts) { Post.published }
end
