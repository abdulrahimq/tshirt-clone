class Api::V1::AuthenticationController < Api::V1::BaseController
  # skip_before_action :authenticate_token!
  # skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    # does something similiar to devise sessions controller
    user = User.find_by(email: params[:email])
    puts user
    if user.valid_password? params[:password]
      # render json: { token: JsonWebToken.encode(sub: user.id )}
      created_jwt = JsonWebToken.encode({sub: user.id})
      cookies.signed[:jwt] = {value: created_jwt, httponly: true, expires: 1.hour.from_now }
      render json: {email: user.email }
    else
      render json: { errors: ["Invalid email or password"]}
    end
  end

  def destroy
    cookies.delete(:jwt)
  end
end
