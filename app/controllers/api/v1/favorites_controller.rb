class Api::V1::FavoritesController < ApplicationController
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