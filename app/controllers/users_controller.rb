class UsersController < ApplicationController
  before_filter :authorize
  expose(:user)
  expose(:posts) { current_user.posts }
end
