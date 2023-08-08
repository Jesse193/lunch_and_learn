class Api::V1::CountriesController < ApplicationController
  def index
    if !params[:country] != ""
      country = CountryFacade.new.country(params[:country])
    else
      country = Faker::WorldCup.team
      require 'pry'; binding.pry
      country = CountryFacade.new.country(params[:country])
    end
    render json: country
  end
end