class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[update destroy]

  # POST /users
  def create
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  # PATCH/PUT /users/42
  def update

    # render ok

    # render error if no Bearer or decode nil or no user

    # check token in headers
    if request.headers['HTTP_AUTHORIZATION'].present?
      # extract token from Bearer
      token = request.headers['HTTP_AUTHORIZATION'].gsub(/Bearer /, '')

      # decode token
      decode_token = JwtUtil.decode(token)

      # extract user id from decoded token
      user_id = decode_token['user_id'] if decode_token

      # find and update user
      @user = User.where(id: user_id).first if user_id
      @user.update(user_params) if @user

      # render json
      render json: @user, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  # DELETE /users/42
  def destroy; end

  private

  def authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

  def authorization_header?
    request.headers['HTTP_AUTHORIZATION'].present?
  end

  def token
    authorization_header.gsub(/Bearer /, '')
  end

  def decode_token
    JwtUtil.decode(token)
  end

  def decode_token?
    decode_token.present?
  end

  def user_id
    decode_token['user_id']
  end

  def authenticate_user
    authorization_header? && decode_token?
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
