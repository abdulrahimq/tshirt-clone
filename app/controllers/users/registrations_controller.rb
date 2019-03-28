# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit(:photo, :first_name, :last_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:photo, :first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  protected

  # lets not delete this line this time - it redirects the user after update

  def after_update_path_for(resource)
    user_path(resource)
  end
end
