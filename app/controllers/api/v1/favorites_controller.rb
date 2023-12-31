class Api::V1::FavoritesController < ApplicationController
  skip_before_action :country
  def index
    user = User.find_by_api_key(params[:api_key])
    if user != nil
      favorites = user.favorites
      render json: FavoriteSerializer.new(favorites)
    end
  end

  def create
    user = User.find_by_api_key(params[:api_key])
    if user != nil
      favorite = user.favorites.create!(favorite_params)
      if favorite.save
        render json: FavoriteSerializer.format(favorite)
      end
    end
  end
  
  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end