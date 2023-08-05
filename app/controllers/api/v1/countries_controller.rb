class Api::V1::CountriesController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:name])
    render json: country
  end
end