class Api::V1::LearningController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:country])
    learning = LearningFacade.new.videos(country[0].name)
    photos = LearningFacade.new.photos(country[0].name)
    options = {}
    options[:params] = {country: country[0].name}
    render json: LearningSerializer.new(learning.first, options)
  end
end