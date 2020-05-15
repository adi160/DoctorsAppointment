class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user_id, only: [:edit, :update, :show, :destroy]
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def show
    authorize @user
  end

  def update
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize @user
    @user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def get_user_id
    @user = User.find(params[:id])
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end