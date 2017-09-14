class AuthController < ApplicationController
  # include JwtUtil

  def create
    user = User.find_by(email: params[:email])
    authenticated_user = user.authenticate(params[:password]) if user

    if authenticated_user
      token = JwtUtil.encode(user_id: user.id)
      render json: { token: token }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def destroy; end

  private

  def user_params
    params.fetch(:email, :password)
  end
end
