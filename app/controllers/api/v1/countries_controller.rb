class Api::V1::CountriesController < ApplicationController
  def index
    country
    render json: country
  end
end