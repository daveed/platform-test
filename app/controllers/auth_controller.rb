class AuthController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    authenticated_user = user.authenticate(auth_params[:password]) if user

    if authenticated_user
      token = JwtUtil.encode(user_id: user.id)
      render json: { token: token }
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  def destroy
    head :ok
  end

  private

  def auth_params
    params.require(:auth).permit(:email, :password)
  end
end
