class Api::V1::AirQualityController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:country])
    air_quality = AirQualityFacade.new.air_quality(country.capital)
    options = {}
    options[:params] = {city: country.capital}
    render json: AirQualitySerializer.new(air_quality, options)
  end
end