class Api::V1::UsersController < Api::V1::BaseController
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

    head :no_content
    end

    def update
        if params[:user][:password].blank?
            params[:user].delete(:password)
            params[:user].delete(:password_confirmation)
        end
        @user = User.find(params[:id])
        authorize @user

        if @user.update(user_params)
            render :show
        else
            render_error
        end
    end

    private

    def user_params
    params.require(:user).permit(:id, :password, :password_confirmation, :photo, :email, :photo_cache, :admin)
    end
end