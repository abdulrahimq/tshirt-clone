class TshirtsController < ApplicationController
  # before_action :tshirt_params, only: [:update]
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @query = params[:query]
    if @query.present?
      @tshirts = policy_scope(Tshirt).search(@query)
    else
      @tshirts = policy_scope(Tshirt)
    end
  end

  def show
    @tshirt = Tshirt.find(params[:id])
    @item = current_rental.items.new
    authorize @tshirt
    authorize @item
  end

  def new
    @tshirt = Tshirt.new
    authorize @tshirt
  end

  def create
    @tshirt = Tshirt.new(tshirt_params)
    @tshirt.user = current_user
    authorize @tshirt
    @tshirt.save
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
    params.require(:tshirt).permit(:name, :description, :photo, :query, :tags)
  end
end
