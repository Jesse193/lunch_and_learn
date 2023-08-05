class Api::V1::LearningController < ApplicationController
  def index
    country = CountryFacade.new.country(params[:country])
    learning = LearningFacade.new.videos(country)
    render json: learning
  end
end