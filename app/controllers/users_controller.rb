class UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer(users).to_serialized_json
  end

  def show
    user = User.all
    render json: user
  end
end
