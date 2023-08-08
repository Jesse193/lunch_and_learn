class Api::V1::LearningController < ApplicationController
  def index
    country
    learning = VideoFacade.new.video(country.name)
    photos = PhotoFacade.new.photos(country.name)
    options = {}
    options[:params] = {country: country.name, photos: photos.first(10)}
    render json: LearningSerializer.new(learning, options)
  end
end