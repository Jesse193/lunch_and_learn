class Api::V1::CountriesController < ApplicationController
  def show
    country = CountryFacade.new.country(name)
  end
end