class Api::V1::BaseController < ActionController::API
  attr_reader :current_user
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_token!

  private

  def authenticate_token!
    payload = JsonWebToken.decode(auth_token)
    if payload.present?
      @current_user = User.find(payload["sub"])
      p @current_user
    else
      render json: {errors: ["Invalid auth token"]}, status: :unauthorized
    end
  rescue JWT::DecodeError
    render json: {errors: ["Invalid auth token, formatting error"]}, status: :unauthorized
  end

  def auth_token
    @auth_token ||= request.headers.fetch("Authorization", " ").split(" ").last
  end
end

