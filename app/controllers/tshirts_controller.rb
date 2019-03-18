class TshirtsController < ApplicationController
  def index
    @tshirts = Tshirt.all
  end

  def new
    @tshirt = Tshirt.new
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.save

    redirect_to tshirts_path
  end

  private

  def tshirt_params
    params.require(:tshirt).permit(:name, :description)
  end
end
