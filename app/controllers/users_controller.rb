class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy]

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
  def update; end

  # DELETE /users/42
  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end
end
