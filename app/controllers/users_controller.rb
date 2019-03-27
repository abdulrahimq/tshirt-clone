class UsersController < ApplicationController
  def index
    @users = policy_scope(User.all).where.not(id: current_user.id)
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

    redirect_to admin_users_path
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.find(params[:id])
    authorize @user

    @user.update(user_params)
    flash[:notice] = "Successfully updated user"
    redirect_to root_path
  end

    private

  def user_params
    params.require(:user).permit(:id, :password, :password_confirmation, :photo, :email, :photo_cache, :admin)
  end
end
