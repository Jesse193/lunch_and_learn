class Api::V1::RecipesController < ApplicationController
  def index
    recipes = RecipeFacade.new.recipes(params[:country])
    render json: recipes
  end
end