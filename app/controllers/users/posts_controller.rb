class Users::PostsController < ApplicationController
  before_filter :authorize

  expose(:post) { current_user.posts.new(params[:post]) }
  expose(:user_post) { current_user.posts.find(params[:id]) }

  def create
    if post.save
      redirect_to :dashboard
    end
  end

  def update
    user_post.update_attributes(params[:post])
    redirect_to :dashboard, notice: "Your post has been updated."
  end
end
