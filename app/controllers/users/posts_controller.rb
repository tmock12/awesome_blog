class Users::PostsController < ApplicationController
  expose(:post) { current_user.posts.new(params[:post]) }

  def create
    if post.save
      redirect_to :dashboard
    end
  end
end
