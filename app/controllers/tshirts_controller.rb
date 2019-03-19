class TshirtsController < ApplicationController
  # before_action :tshirt_params, only: [:update]
  def index
    @tshirts = Tshirt.all
  end

  def show
    @tshirt = Tshirt.find(params[:id])
  end

  def new
    @tshirt = Tshirt.new
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.save

    redirect_to tshirts_path
  end

  def edit
    @tshirt = Tshirt.find(params[:id])
  end

  def update
    @tshirt = Tshirt.find(params[:id])
    if @tshirt.update(tshirt_params)
      redirect_to tshirt_path(@tshirt)
    else
      redner :edit
    end
  end

  def destroy
    @tshirt = Tshirt.find(params[:id])
    @tshirt.destroy

    redirect_to tshirts_path
  end

  private

  def tshirt_params
    params.require(:tshirt).permit(:name, :description)
  end
end
