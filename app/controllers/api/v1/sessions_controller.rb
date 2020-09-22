class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: sessions_params[:email])
    if user.nil?
      render json: {error: "User not found"}, status: 400
    else
      if user.authenticate(sessions_params[:password])
        render json: UserSerializer.new(user), status: 201
      else
        render json: {error: "Incorrect Password"}, status: 400
      end
    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
