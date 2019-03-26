# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  private
  # After_update_path_for isn't needed probably
  def after_update_path_for(resource)
    user_path(resource)
  end

  def sign_up_params
    params.require(:user).permit(:photo, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:photo, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end
