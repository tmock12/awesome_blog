class PostsController < ApplicationController
  expose(:posts) { Post.published }
  expose(:post)

  def show
    if request.path != post_path(post)
      redirect_to post, status: :moved_permanently
    end
  end
end
