class Api::V1::AuthenticationController < Api::V1::BaseController
  # skip_before_action :authenticate_token!
  # skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user!

  def create
    # does something similiar to devise sessions controller
    user = User.find_by(email: params[:user][:email])
    if user.valid_password? params[:user][:password]
      render json: { token: JsonWebToken.encode(sub: user.id )}
    else
      render json: { errors: ["Invalid email or password"]}
    end
  end
end
