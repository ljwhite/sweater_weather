class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: sessions_params[:email])
    if user.authenticate(sessions_params[:password])
      render json: UserSerializer.new(user), status: 201
    else
      render json: {error: "Email Not Found"}, status: 422
    end
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end
end
