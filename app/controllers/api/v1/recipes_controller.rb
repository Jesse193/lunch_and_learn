class Api::V1::RecipesController < ApplicationController
  def index
    recipes = RecipeFacade.new.recipes(params[:country])
    options = {}
    options[:is_collection]
    render json: RecipeSerializer.new(recipes, options)
  end
end