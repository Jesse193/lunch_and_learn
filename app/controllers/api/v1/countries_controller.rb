class Api::V1::CountriesController < ApplicationController
  def index
    render json: country
  end
end