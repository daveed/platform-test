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

  # PUT /users/42
  def update
    @user = User.where(id: user_id).first if user_id
    if @user
      @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  # DELETE /users/42
  def destroy
    @user = User.where(id: user_id).first if user_id
    if @user
      @user.destroy
      render json: @user, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def authorization_header
    request.headers['HTTP_AUTHORIZATION']
  end

  def authorization_header?
    authorization_header.present?
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
    render json: { error: 'unauthorized' }, status: :unauthorized unless authorization_header? && decode_token?
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
