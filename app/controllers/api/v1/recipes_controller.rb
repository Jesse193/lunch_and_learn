class Api::V1::RecipesController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:country])
    recipes = RecipeFacade.new.recipes(country.demonym, params[:country])
    options = {}
    options[:is_collection]
    options[:params] = {country: country.name}
    render json: RecipeSerializer.new(recipes, options)
  end
end