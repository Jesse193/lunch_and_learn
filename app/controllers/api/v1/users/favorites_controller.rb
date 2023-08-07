class Api::V1::Users::FavoritesController < ApplicationController
  def create
    favorite = Favorite.create!(params)
    if favorite.save
      render json: FavoriteSerializer.new(favorite)
    end
  end
  
  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :api_key)
  end
end