class UsersController < ApplicationController
  expose(:user)
  expose(:posts) { current_user.posts }
end
