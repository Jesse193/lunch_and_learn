class Api::V1::CountriesController < ApplicationController
  def show
    country = CountryFacade.new.country(country)
  end
end