class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:email] = user.email
      render json: SessionSerializer.format(session)
    else
      raise "Error: Email and password must be valid"
    end
  end
end