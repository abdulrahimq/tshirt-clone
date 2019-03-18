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

    redirect_to tshirt_path(@tshirt)
  end

  private

  def tshirt_params
    params.require(:tshirt).permit(:name, :description)
  end
end
