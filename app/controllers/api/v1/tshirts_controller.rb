class Api::V1::TshirtsController < Api::V1::BaseController
  before_action :set_restaurant, only: [:show]
  def index
    puts Tshirt.count
    @tshirts = policy_scope(Tshirt)
  end

  def show
  end

  private

  def set_restaurant
    @tshirt = Tshirt.find(params[:id])
  end
end
