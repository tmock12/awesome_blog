class SessionsController < ApplicationController

  expose(:user) { User.from_omniauth(env["omniauth.auth"]) }

  def create
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
