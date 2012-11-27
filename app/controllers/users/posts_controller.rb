class Users::PostsController < ApplicationController
  before_filter :authorize

  expose(:post) { current_user.posts.new(params[:post]) }
  expose(:user_post) { current_user.posts.find(params[:id]) }

  def create
    if post.save
      redirect_to :dashboard
    else
      render :new
    end
  end

  def update
    if  user_post.update_attributes(params[:post])
      redirect_to :dashboard, notice: "Your post has been updated."
    else
      render :edit
    end
  end

  def destroy
    user_post.destroy
    redirect_to :dashboard, notice: "Your post has been deleted"
  end
end
