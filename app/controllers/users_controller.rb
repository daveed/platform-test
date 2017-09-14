class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # POST /users
  def create; end

  # PATCH/PUT /users/42
  def update; end

  # DELETE /users/42
  def destroy; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {})
  end
end
