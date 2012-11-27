class PostsController < ApplicationController
  expose(:posts) { Post.published.paginate(page: params[:page], per_page: 3) }
  expose(:post)

  def show
    if request.path != post_path(post)
      redirect_to post, status: :moved_permanently
    end
  end
end
