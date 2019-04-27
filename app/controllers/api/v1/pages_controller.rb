class Api::V1::PagesController < Api::V1::ActionController::API
  # skip_before_action :authenticate_user!, only: [:home]
  def index
    @tshirts = Tshirt.all
    render json: @tshirts
  end
end
