class Api::V1::CountriesController < ApplicationController
  def index
    if params[:country] != ""
      country = CountryFacade.new.country(params[:country])
    else 
      country = CountryFacade.new.random_country
    end
    render json: country
  end
end