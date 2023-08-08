class ApplicationController < ActionController::API
  before_action :country, :only => [:index]
  def country
    if params[:country] != ""
      country = CountryFacade.new.country(params[:country])
    else 
      country = CountryFacade.new.random_country
    end
  end
end
