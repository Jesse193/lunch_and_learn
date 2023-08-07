class Api::V1::RecipesController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:country])
    recipes = RecipeFacade.new.recipes(country.demonym)
    options = {}
    options[:is_collection]
    render json: RecipeSerializer.new(recipes, options)
  end
end