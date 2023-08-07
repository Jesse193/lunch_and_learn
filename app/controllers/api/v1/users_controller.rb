class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create!(user_params)
    if new_user.save
      new_user.api_key = SecureRandom.hex(15)
      render json: UserSerializer.new(new_user)
    end
  end
  private
  def user_params
    params.permit(:name, :email, :password)
  end
end