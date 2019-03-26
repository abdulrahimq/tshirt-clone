class UsersController < ApplicationController
  def index
    @users = policy_scope(User.all)
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy

    redirect_to users_path
  end
end
