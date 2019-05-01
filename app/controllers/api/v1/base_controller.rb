class Api::V1::BaseController < ActionController::API
  # skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  private

end

