class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    service = find_service
    if service.present?
      user = service.user
      success(user)
    else
      user = create_user
      user.valid? ? create_service(user) : display_error
    end
  end

  def google_oauth2
    service = find_service
    if service.present?
      user = service.user
      success(user)
    else
      user = create_user
      user.valid? ? create_service(user) : display_error
    end
  end

  private

  def find_service
    Service.where(provider: auth.provider, uid: auth.uid).first
  end

  def auth
    request.env['omniauth.auth']
  end

  def success(user)
    provider = auth.provider.to_s == 'google_oauth2' ? 'google' : 'facebook'
    sign_in_and_redirect user, event: :authentication
    set_flash_message :notice, :success, kind: provider
  end

  def display_error
    flash[:error] = "Are you trying to login with a different provider than you signed up with?"
    redirect_to new_user_session_path
  end

  def create_user
    User.create(
      email: auth.info.email,
      password: Devise.friendly_token[0, 20]
    )
  end

  def create_service(user)
    user.services.create!(
      provider: auth.provider,
      uid: auth.uid,
      expires_at: Time.at(auth.credentials.expires_at),
      access_token: auth.credentials.token
    )

    success(user)
  end
end
