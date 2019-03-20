class TshirtsController < ApplicationController
  # before_action :tshirt_params, only: [:update]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @tshirts = policy_scope(Tshirt)
    @creators = User.where.not(latitude: nil, longitude: nil)

    @markers = @creators.map do |creator|
      {
        lat: creator.latitude,
        lng: creator.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { creator: creator }),
        image_url: helpers.asset_url('default')
      }
    end
  end

  def show
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
  end

  def new
    @tshirt = Tshirt.new
    authorize @tshirt
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.user = current_user
    authorize @tshirt
    @tshirt.save!

    redirect_to tshirts_path
  end

  def edit
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
  end

  def update
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
    if @tshirt.update(tshirt_params)
      redirect_to tshirt_path(@tshirt)
    else
      render :edit
    end
  end

  def destroy
    @tshirt = Tshirt.find(params[:id])
    authorize @tshirt
    @tshirt.destroy

    redirect_to tshirts_path
  end

  private

  def tshirt_params
    params.require(:tshirt).permit(:name, :description, :photo)
  end
end
