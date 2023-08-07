class Api::V1::LearningController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:country])
    learning = LearningFacade.new.video(country.name)
    photos = LearningFacade.new.photos(country.name)
    options = {}
    options[:params] = {country: country.name, photos: photos.first(10)}
    render json: LearningSerializer.new(learning, options)
  end
end