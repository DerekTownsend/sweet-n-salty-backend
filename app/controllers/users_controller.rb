class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.all
    render json: users
  end
end
