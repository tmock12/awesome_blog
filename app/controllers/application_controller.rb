class ApplicationController < ActionController::Base
  protect_from_forgery
  around_filter :user_time_zone, if: :current_user

  private

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to root_path, alert: "Please sign in" if current_user.nil?
  end

  def user_time_zone(&block)
    Time.use_zone(current_user.time_zone, &block)
  end

  helper_method :current_user
end
